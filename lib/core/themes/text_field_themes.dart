import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_front_end/core/constants/app_styles.dart';
import 'package:todo_app_front_end/core/constants/color_palatte.dart';

class CustomTextFieldTheme {
  static InputDecorationTheme get light => InputDecorationTheme(
        filled: true,
        border: _buildOutlineInputBorder(color: ColorPalette.primary50),
        fillColor: ColorPalette.greyscale50,
        enabledBorder: _buildOutlineInputBorder(color: ColorPalette.primary50),
        focusedBorder: _buildOutlineInputBorder(
          color: ColorPalette.primary,
        ),
        errorBorder: _buildOutlineInputBorder(color: ColorPalette.error),
        focusedErrorBorder: _buildOutlineInputBorder(color: ColorPalette.error),
        hintStyle: AppTextStyle.primaryhintStyle,
      );

  static _buildOutlineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0.r),
      borderSide: BorderSide(color: color, width: 1),
    );
  }
}
