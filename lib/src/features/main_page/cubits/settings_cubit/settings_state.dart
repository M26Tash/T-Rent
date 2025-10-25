part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final CustomizedRoute route;
  final bool isDarkThemeEnabled;
  final bool isNotificationEnabled;

  @override
  List<Object?> get props => [
        route,
        isDarkThemeEnabled,
        isNotificationEnabled,
      ];

  const SettingsState({
    required this.route,
    required this.isDarkThemeEnabled,
    required this.isNotificationEnabled,
  });

  SettingsState copyWith({
    CustomizedRoute? route,
    bool? isDarkThemeEnabled,
    bool? isNotificationEnabled,
  }) {
    return SettingsState(
      route: route ?? this.route,
      isDarkThemeEnabled: isDarkThemeEnabled ?? this.isDarkThemeEnabled,
      isNotificationEnabled:
          isNotificationEnabled ?? this.isNotificationEnabled,
    );
  }
}
