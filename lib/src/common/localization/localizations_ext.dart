import 'package:flutter/material.dart';
import 'package:t_rent/src/common/localization/flutter_gen/app_localizations.dart';

extension LocalizationsExt on BuildContext {
  AppLocalization get locale => AppLocalization.of(this);
}
