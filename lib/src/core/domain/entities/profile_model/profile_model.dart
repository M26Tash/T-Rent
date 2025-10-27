import 'package:t_rent/src/core/domain/entities/domain_object.dart';

final class ProfileModel extends DomainObject {
  final String? id;
  final String? fullName;
  final String? phoneNumber;
  final String? avatarUrl;
  final String? email;
  final DateTime? updatedAt;
  final DateTime? dateOfBirth;
  @override
  List<Object?> get props => [
        id,
        fullName,
        phoneNumber,
        avatarUrl,
        email,
        updatedAt,
        dateOfBirth,
      ];

  const ProfileModel({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.avatarUrl,
    this.email,
    this.updatedAt,
    this.dateOfBirth,
  });

  @override
  ProfileModel copyWith({
    DateTime? dateOfBirth,
  }) {
    return ProfileModel(
      id: id,
      fullName: fullName,
      phoneNumber: phoneNumber,
      avatarUrl: avatarUrl,
      email: email,
      updatedAt: updatedAt,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }
}
