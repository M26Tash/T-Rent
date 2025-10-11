part of 'app_cubit.dart';

class AppState extends Equatable {
  final ThemeType themeType;
  final Locale locale;
  @override
  List<Object?> get props => [
        themeType,
        locale,
      ];

  const AppState({
    required this.themeType,
    required this.locale,
  });

  AppState copyWith({
    ThemeType? themeType,
    Locale? locale,
  }) {
    return AppState(
      themeType: themeType ?? this.themeType,
      locale: locale ?? this.locale,
    );
  }
}
