import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/extensions/string_extension.dart';

class LanguageItem extends StatelessWidget {
  final String languageCode;
  final String currentLocale;
  final ValueChanged<String> onValueChanged;
  const LanguageItem({
    required this.languageCode,
    required this.currentLocale,
    required this.onValueChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(
          AppDimensions.preLarge,
        ),
      ),
      onTap: () {
        onValueChanged(languageCode);
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.large),
        decoration: BoxDecoration(
          color: currentLocale == languageCode
              ? context.theme.accentColor
              : context.theme.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppDimensions.preLarge,
            ),
          ),
        ),
        child: Row(
          children: [
            CountryFlag.fromLanguageCode(languageCode),
            const SizedBox(width: AppDimensions.large),
            Text(
              '${LocaleNames.of(context)?.nameOf(languageCode)?.capitalize()}',
              style: context.themeData.textTheme.headlineMedium?.copyWith(
                color: context.theme.primaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
