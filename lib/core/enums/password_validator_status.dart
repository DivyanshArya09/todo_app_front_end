import 'package:flutter/material.dart';
import 'package:todo_app_front_end/core/constants/color_palatte.dart';

enum PasswordValidationStatus { WEAK, MEDIUM, STRONG, SHORT }

extension PasswordValidationStatusExtension on PasswordValidationStatus {
  String get value {
    switch (this) {
      case PasswordValidationStatus.WEAK:
        return 'Weak';
      case PasswordValidationStatus.MEDIUM:
        return 'Medium';
      case PasswordValidationStatus.STRONG:
        return 'Strong';
      case PasswordValidationStatus.SHORT:
        return 'Short Password';
    }
  }

  double get score {
    switch (this) {
      case PasswordValidationStatus.WEAK:
        return 0.3;
      case PasswordValidationStatus.MEDIUM:
        return 0.75;
      case PasswordValidationStatus.STRONG:
        return 1.0;
      case PasswordValidationStatus.SHORT:
        return 0.15;
    }
  }

  Color get color {
    switch (this) {
      case PasswordValidationStatus.WEAK:
        return ColorPalette.error;
      case PasswordValidationStatus.MEDIUM:
        return ColorPalette.warning;
      case PasswordValidationStatus.STRONG:
        return ColorPalette.success;
      case PasswordValidationStatus.SHORT:
        return ColorPalette.error;
    }
  }

  String get message {
    switch (this) {
      case PasswordValidationStatus.WEAK:
        return 'Password is too weak';
      case PasswordValidationStatus.MEDIUM:
        return 'Please use special characters or numbers';
      case PasswordValidationStatus.STRONG:
        return 'You are good to go!';
      case PasswordValidationStatus.SHORT:
        return 'Password is too short';
    }
  }

  Icon get icon {
    switch (this) {
      case PasswordValidationStatus.WEAK:
        return const Icon(
          Icons.error,
          color: ColorPalette.error,
        );

      case PasswordValidationStatus.MEDIUM:
        return const Icon(
          Icons.info,
          color: ColorPalette.primary,
        );

      case PasswordValidationStatus.STRONG:
        return const Icon(
          Icons.check_circle,
          color: ColorPalette.success,
        );

      default:
        return const Icon(
          Icons.error,
          color: ColorPalette.error,
        );
    }
  }
}
