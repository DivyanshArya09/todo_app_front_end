import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_front_end/core/constants/color_palatte.dart';
import 'package:todo_app_front_end/core/themes/text_field_themes.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    inputDecorationTheme: CustomTextFieldTheme.light,
    brightness: Brightness.light,
    // appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return ColorPalette.primary; // Fill with primary when selected
        }
        return Colors.white; // Fill with white when not selected
      }),
      checkColor:
          MaterialStateProperty.all(Colors.white), // Always white checkmark
      side: const BorderSide(
        color: ColorPalette.primary,
        width: 1,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(1)),
      ),
    ),
    iconTheme: IconThemeData(
      color: ColorPalette.white,
      size: 20.sp,
    ),
  );
}
