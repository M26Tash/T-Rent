import 'package:flutter/material.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';

enum CarType { all, suv, sedan, hatchback, sport, pickup, minivan }

extension CarTypeExtension on CarType {
  String displayName(BuildContext context) {
    switch (this) {
      case CarType.all:
        return context.locale.all;
      case CarType.suv:
        return context.locale.suv;
      case CarType.sedan:
        return context.locale.sedan;
      case CarType.hatchback:
        return context.locale.hatchback;
      case CarType.sport:
        return context.locale.sport;
      case CarType.pickup:
        return context.locale.pickup;
      case CarType.minivan:
        return context.locale.minivan;
    }
  }
}
