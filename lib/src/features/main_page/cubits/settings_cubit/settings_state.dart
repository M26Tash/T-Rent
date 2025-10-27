part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final CustomizedRoute route;
  final ProfileModel? profile;
  final bool isDarkThemeEnabled;
  final bool isNotificationEnabled;

  @override
  List<Object?> get props => [
        route,
        profile,
        isDarkThemeEnabled,
        isNotificationEnabled,
      ];

  const SettingsState({
    required this.route,
    required this.profile,
    required this.isDarkThemeEnabled,
    required this.isNotificationEnabled,
  });

  SettingsState copyWith({
    CustomizedRoute? route,
    ProfileModel? profile,
    bool? isDarkThemeEnabled,
    bool? isNotificationEnabled,
  }) {
    return SettingsState(
      route: route ?? this.route,
      profile: profile ?? this.profile,
      isDarkThemeEnabled: isDarkThemeEnabled ?? this.isDarkThemeEnabled,
      isNotificationEnabled:
          isNotificationEnabled ?? this.isNotificationEnabled,
    );
  }
}
