part of 'my_account_cubit.dart';

class MyAccountState extends Equatable {
  final CustomizedRoute route;
  final ProfileModel? profile;
  final DateTime? dateOfBirth;
  final XFile? image;

  @override
  List<Object?> get props => [
        route,
        profile,
        dateOfBirth,
        image,
      ];

  const MyAccountState({
    required this.route,
    required this.profile,
    required this.dateOfBirth,
    required this.image,
  });

  MyAccountState copyWith({
    CustomizedRoute? route,
    ProfileModel? profile,
    DateTime? dateOfBirth,
    XFile? image,
  }) {
    return MyAccountState(
      route: route ?? this.route,
      profile: profile ?? this.profile,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      image: image ?? this.image,
    );
  }
}
