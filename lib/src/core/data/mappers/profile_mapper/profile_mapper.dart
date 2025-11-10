import 'package:t_rent/src/core/data/mappers/base_mapper.dart';
import 'package:t_rent/src/core/domain/entities/profile_model/profile_model.dart';

final class ProfileMapper implements BaseMapper<ProfileModel> {
  @override
  Map<String, dynamic> toJson(ProfileModel data) {
    return {
      _Fields.id: data.id,
      _Fields.fullName: data.fullName,
      _Fields.phoneNumber: data.phoneNumber,
      _Fields.avatarUrl: data.avatarUrl,
      _Fields.email: data.email,
      _Fields.updatedAt: data.updatedAt,
      _Fields.dateOfBirth: data.dateOfBirth?.toIso8601String(),
    };
  }

  @override
  ProfileModel fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json[_Fields.id],
      fullName: json[_Fields.fullName],
      phoneNumber: json[_Fields.phoneNumber],
      avatarUrl: json[_Fields.avatarUrl],
      email: json[_Fields.email],
      updatedAt: json[_Fields.updatedAt],
      dateOfBirth: json[_Fields.dateOfBirth] == null
          ? null
          : DateTime.tryParse(
              json[_Fields.dateOfBirth],
            ),
    );
  }
}

abstract final class _Fields {
  static const String id = 'id';
  static const String fullName = 'full_name';
  static const String phoneNumber = 'phone_number';
  static const String avatarUrl = 'avatar_url';
  static const String email = 'email';
  static const String updatedAt = 'updated_at';
  static const String dateOfBirth = 'date_of_birth';
}
