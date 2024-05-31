import 'package:flutter/material.dart';
import 'package:todo_app_front_end/core/constants/app_styles.dart';
import 'package:todo_app_front_end/core/constants/color_palatte.dart';

enum TextFieldType {
  PRIMARY,
  SECONDARY,
}

extension TextFieldTypeExtension on TextFieldType {
  TextStyle get inputStyle {
    switch (this) {
      case TextFieldType.PRIMARY:
        return AppTextStyle.primaryInputTextStyle;
      //! In future add Secondary input style
      default:
        return AppTextStyle.primaryInputTextStyle;
    }
  }

  TextStyle get hintStyle {
    switch (this) {
      case TextFieldType.PRIMARY:
        return AppTextStyle.primaryhintStyle;
      //! In future add Secondary hint style
      default:
        return AppTextStyle.primaryhintStyle;
    }
  }

  Color get fillColor {
    switch (this) {
      case TextFieldType.PRIMARY:
        return ColorPalette.greyscale50;

      //! In future add Secondary fill color

      default:
        return ColorPalette.greyscale50;
    }
  }
}
