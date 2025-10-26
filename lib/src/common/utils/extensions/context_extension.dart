import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

extension ContextExtension on BuildContext {
  Future<void> showSuccessSnackBar(String message) async {
    showTopSnackBar(
      Overlay.of(this),
      CustomSnackBar.success(
        message: message,
      ),
    );
  }

  Future<void> showErrorSnackBar(String message) async {
    showTopSnackBar(
      Overlay.of(this),
      CustomSnackBar.error(
        message: message,
      ),
    );
  }

  Future<void> showInfoSnackBar(String message) async {
    showTopSnackBar(
      Overlay.of(this),
      CustomSnackBar.info(
        message: message,
      ),
    );
  }
}
