part of 'user_details_cubit.dart';

class UserDetailsState extends Equatable {
  final CustomizedRoute route;
  final DateTime? dateOfBirth;
  final XFile? image;

  @override
  List<Object?> get props => [
        route,
        dateOfBirth,
        image,
      ];

  const UserDetailsState({
    required this.route,
    required this.dateOfBirth,
    required this.image,
  });

  UserDetailsState copyWith({
    CustomizedRoute? route,
    DateTime? dateOfBirth,
     XFile? image,
  }) {
    return UserDetailsState(
      route: route ?? this.route,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      image: image ?? this.image,
    );
  }
}
