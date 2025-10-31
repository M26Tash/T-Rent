import 'package:flutter/material.dart';

enum FilterTab {
  price,
  year,
  mileage,
}

extension FilterTabName on FilterTab {
  String displayName(BuildContext context) {
    switch (this) {
      case FilterTab.price:
        return 'Price';
      case FilterTab.year:
        return 'Year';
      case FilterTab.mileage:
        return 'Mileage';
    }
  }
}
