part of 'app_theme_cubit.dart';

final class AppThemeState extends Equatable {
  final ThemeType themeType;

  @override
  List<Object?> get props => [
        themeType,
      ];

  const AppThemeState({
    required this.themeType,
  });

  AppThemeState copyWith({
    ThemeType? themeType,
  }) {
    return AppThemeState(
      themeType: themeType ?? this.themeType,
    );
  }
}
