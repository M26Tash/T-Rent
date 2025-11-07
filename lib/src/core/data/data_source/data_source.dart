import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:rxdart/subjects.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t_rent/src/common/utils/enums/car_type.dart';
import 'package:t_rent/src/common/utils/enums/drive_type.dart';
import 'package:t_rent/src/common/utils/enums/fuel_type.dart';
import 'package:t_rent/src/common/utils/enums/transmission_type.dart';
import 'package:t_rent/src/core/data/data_source/interfaces/i_data_source.dart';
import 'package:t_rent/src/core/data/mappers/car_mapper/car_mapper.dart';
import 'package:t_rent/src/core/data/mappers/profile_mapper/profile_mapper.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/core/domain/entities/profile_model/profile_model.dart';
import 'package:t_rent/src/core/domain/utils/core_logger.dart';

class DataSource implements IDataSource {
  final SupabaseClient supabase = Supabase.instance.client;

  final BehaviorSubject<ProfileModel?> _profileSubject = BehaviorSubject();
  final BehaviorSubject<List<CarModel>?> _carsSubject = BehaviorSubject();

  ProfileModel? _cachedProfile;

  List<CarModel>? _cachedCars;

  String get userid => supabase.auth.currentUser!.id;

  @override
  Stream<ProfileModel?> get profileStream => _profileSubject;

  @override
  Stream<List<CarModel>?> get carstream => _carsSubject;

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
      final response = await supabase.from('profiles').select();

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
      // await supabase.from('cars').insert(carsDb);

      final response = await supabase.from('cars').select();
      CoreLogger.warningLog('$response');
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
}

final Map<String, Object> carsDb = {
  'brand': 'ZEEKR',
  'model': '001 Performance',
  'year': 2025,
  'type': CarType.hatchback.name,
  'transmission_type': TransmissionType.automatic.name,
  'fuel_type': FuelType.electric.name,
  'fuel_consumption': 18.5,
  'seats': 5,
  'doors': 5,
  'mileage': 1293,
  'car_specs': {
    'engine_capacity': 0,
    'horsepower': 537,
    'torque': 686,
    'zero_to_hundred': 3.9,
    'top_speed': 200,
    'drive_type': DriveType.awd.name,
  },
  'car_pricing': {
    'per_hour': 3500,
    'per_day': 11000,
    'per_week': 75000,
    'deposit': 130000,
  },
  'car_image': {
    'side_view':
        'https://drive.google.com/uc?export=view&id=1HmX09PSJLmV3_bSsW5xJ81k0_9Rg8n1_',
    'front_view':
        'https://drive.google.com/uc?export=view&id=1FNNJshJ6YUYauLCKXAZLadg7V9283w0M',
  },
  'car_coordinates': {
    'latitude': 41.134512,
    'longitude': 29.062161,
  },
};
