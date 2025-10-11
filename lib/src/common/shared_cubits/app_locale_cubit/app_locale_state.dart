part of 'app_locale_cubit.dart';

final class AppLocaleState extends Equatable{
  final Locale? locale;

  @override
  List<Object?> get props => [
        locale,
      ];

  const AppLocaleState({
    required this.locale,
  });

  AppLocaleState copyWith({
    Locale? locale,
  }) {
    return AppLocaleState(
      locale: locale ?? this.locale,
    );
  }
}
