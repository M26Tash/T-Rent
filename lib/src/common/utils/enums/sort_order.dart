import 'package:flutter/material.dart';

enum SortOrder {
  descending,
  ascending,
}

extension SortOrderName on SortOrder {
  String displayName(BuildContext context) {
    switch (this) {
      case SortOrder.ascending:
        return 'Ascending';
      case SortOrder.descending:
        return 'Descending';
    }
  }
}
