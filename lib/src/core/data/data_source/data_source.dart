import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:rxdart/subjects.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t_rent/src/core/data/data_source/interfaces/i_data_source.dart';
import 'package:t_rent/src/core/data/mappers/car_mapper/car_mapper.dart';
import 'package:t_rent/src/core/data/mappers/car_order_mapper/car_order_mapper.dart';
import 'package:t_rent/src/core/data/mappers/profile_mapper/profile_mapper.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/core/domain/entities/car_order_model/car_order_model.dart';
import 'package:t_rent/src/core/domain/entities/profile_model/profile_model.dart';
import 'package:t_rent/src/core/domain/utils/core_logger.dart';

class DataSource implements IDataSource {
  final SupabaseClient supabase = Supabase.instance.client;

  final BehaviorSubject<ProfileModel?> _profileSubject = BehaviorSubject();
  final BehaviorSubject<List<CarModel>?> _carsSubject = BehaviorSubject();
  final BehaviorSubject<List<CarOrderModel>?> _carRentHistorySubject =
      BehaviorSubject();

  ProfileModel? _cachedProfile;

  List<CarModel>? _cachedCars;

  List<CarOrderModel>? _cachedCarRentHistory;

  String get userid => supabase.auth.currentUser!.id;

  @override
  Stream<ProfileModel?> get profileStream => _profileSubject;

  @override
  Stream<List<CarModel>?> get carStream => _carsSubject;

  @override
  Stream<List<CarOrderModel>?> get carRentHistoryStream =>
      _carRentHistorySubject;

  @override
  Future<void> updateProfile(ProfileModel profile) async {
    try {
      final updatedFields = <String, dynamic>{};

      if (profile.fullName != null) {
        updatedFields['full_name'] = profile.fullName;
      }
      if (profile.phoneNumber != null) {
        updatedFields['phone_number'] = profile.phoneNumber;
      }
      if (profile.avatarUrl != null) {
        updatedFields['avatar_url'] = profile.avatarUrl;
      }
      if (profile.email != null) {
        updatedFields['email'] = profile.email;
      }
      if (profile.updatedAt != null) {
        updatedFields['updated_at'] = profile.updatedAt!.toIso8601String();
      }

      if (profile.dateOfBirth != null) {
        updatedFields['date_of_birth'] = profile.dateOfBirth!.toIso8601String();
      }

      await supabase.from('profiles').update(updatedFields).eq('id', userid);

      final metadataUpdate = <String, dynamic>{};
      if (profile.fullName != null) {
        metadataUpdate['full_name'] = profile.fullName;
      }
      if (profile.avatarUrl != null) {
        metadataUpdate['avatar_url'] = profile.avatarUrl;
      }
      if (profile.dateOfBirth != null) {
        metadataUpdate['date_of_birth'] =
            profile.dateOfBirth!.toIso8601String();
      }
      if (profile.phoneNumber != null) {
        metadataUpdate['phone_number'] = profile.phoneNumber;
      }

      if (metadataUpdate.isNotEmpty) {
        await supabase.auth.updateUser(
          UserAttributes(data: metadataUpdate),
        );
      }
    } on PostgrestException catch (e) {
      CoreLogger.errorLog(
        'updateProfile()',
        params: {
          'Caught error': e.message,
        },
      );
    }
  }

  @override
  Future<void> getProfile() async {
    if (_cachedProfile != null) {
      _profileSubject.add(_cachedProfile);
      CoreLogger.warningLog('Serving cached profile');
    }

    try {
      final response = await supabase.from('profiles').select().eq(
            'id',
            userid,
          );

      if (response.isNotEmpty) {
        final profile =
            response.map((item) => ProfileMapper().fromJson(item)).toList();

        _cachedProfile = profile.first;

        _profileSubject.add(profile.first);
      }

      supabase
          .channel('profiles_channel')
          .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'profiles',
            callback: (payload) {
              getProfile();
            },
          )
          .subscribe();
    } on PostgrestException catch (e) {
      CoreLogger.errorLog(
        'getProfile()',
        params: {
          'Caught error': e.message,
        },
      );
    }
  }

  @override
  Future<void> uploadAvatar(XFile? avatar) async {
    const yearInSeconds = 31536000;
    try {
      if (avatar != null) {
        final file = File(avatar.path);

        await supabase.storage.from('avatars').upload(
              userid,
              file,
              fileOptions: const FileOptions(
                upsert: true,
              ),
            );

        final signedUrl =
            await supabase.storage.from('avatars').createSignedUrl(
                  userid,
                  yearInSeconds,
                );

        updateProfile(
          ProfileModel(
            avatarUrl: signedUrl,
          ),
        );
      }
    } on StorageException catch (e) {
      CoreLogger.errorLog(
        'uploadAvatar()',
        params: {
          'Caught error': e.message,
        },
      );
    }
  }

  @override
  Future<void> getCars() async {
    if (_cachedCars != null) {
      _carsSubject.add(_cachedCars);
      CoreLogger.warningLog('Serving cached cars');
    }

    try {
      final response = await supabase.from('cars').select();

      if (response.isNotEmpty) {
        final cars =
            response.map((item) => CarMapper().fromJson(item)).toList();

        _cachedCars = cars;

        _carsSubject.add(cars);
      }

      supabase
          .channel('cars_channel')
          .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'cars',
            callback: (payload) {
              getCars();
            },
          )
          .subscribe();
    } on StorageException catch (e) {
      CoreLogger.errorLog(
        'getCars()',
        params: {
          'Caught error': e.message,
        },
      );
    }
  }

  @override
  Future<void> uploadCarRent({
    required CarOrderModel carOrder,
    required CarModel car,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final newCarOrder = carOrder.copyWith(
        userId: supabase.auth.currentUser?.id,
      );

      await supabase.from('car_rent_history').insert(
            CarOrderMapper().toJson(newCarOrder),
          );
    } on StorageException catch (e) {
      CoreLogger.errorLog(
        'uploadCarRent()',
        params: {
          'Caught error': e.message,
        },
      );
    }
  }

  @override
  Future<void> getCarRentHistory({int? carId}) async {
    if (carId == null && _cachedCarRentHistory != null) {
      _carRentHistorySubject.add(_cachedCarRentHistory);
      CoreLogger.warningLog('Serving cached car rent history');
      return;
    }

    try {
      final base = supabase
          .from('car_rent_history')
          .select('*, cars(*)')
          .eq('user_id', supabase.auth.currentUser!.id);

      final response = carId == null
          ? await base.order('created_at', ascending: false)
          : await base
              .eq('car_id', carId)
              .order('created_at', ascending: false);

      final rows = (response as List).cast<Map<String, dynamic>>();

      final carOrdersHistory = rows.map((e) {
        final order = CarOrderMapper().fromJson(e);

        final totalDays = (order.startDate != null && order.endDate != null)
            ? order.endDate!.difference(order.startDate!).inDays
            : null;

        final totalPrice = (totalDays != null)
            ? totalDays * order.car.carPricing.perDay
            : null;

        return order.copyWith(
          totalDays: totalDays,
          totalPrice: totalPrice,
        );
      }).toList();

      if (carOrdersHistory.isNotEmpty) {
        if (carId == null) {
          _cachedCarRentHistory = carOrdersHistory;
        }
        _carRentHistorySubject.add(carOrdersHistory);
      } else {
        _carRentHistorySubject.add(<CarOrderModel>[]);
      }
    } on PostgrestException catch (e) {
      CoreLogger.errorLog('getCarRentHistory()',
          params: {'error': e.message, 'carId': carId},);
    } on StorageException catch (e, st) {
      CoreLogger.errorLog('getCarRentHistory()', params: {
        'error': e.toString(),
        'carId': carId,
        'stack': st.toString(),
      },);
    }
  }
}
