import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_front_end/core/constants/color_palatte.dart';

class AppTextStyle {
  // =======================BODY STYLE'S=======================

  static TextStyle bodyMedium_dark = TextStyle(
    fontSize: 12.0.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalette.black, // You can customize the color
  );
  static TextStyle bodyMedium_light = TextStyle(
    fontSize: 12.0.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalette.white, // You can customize the color
  );
  static TextStyle bodyBold_greyscale = TextStyle(
    fontSize: 12.0.sp,
    fontWeight: FontWeight.w800,
    color: ColorPalette.greyscale800, // You can customize the color
  );

  static TextStyle body_18_dark = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: ColorPalette.black,
  );

  static TextStyle bodySemibold10_dark = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalette.greyscale600,
  );

  static TextStyle bodyRegular_dark = TextStyle(
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalette.black, // You can customize the color
  );
  static TextStyle bodyRegular_greyscale700 = TextStyle(
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalette.greyscale700, // You can customize the color
  );

  static TextStyle bodyBoldLabel_light = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: ColorPalette.greyscale50,
  );

  static TextStyle bodyBoldLabel_blue = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: ColorPalette.primary,
  );

  static TextStyle bodyBold_dark = TextStyle(
    fontSize: 14.0.sp,
    fontWeight: FontWeight.bold,
    color: ColorPalette.black, // You can customize the color
  );

  static TextStyle bodySemibold_light = TextStyle(
    color: const Color(0xFFFFFEFE),
    fontSize: 12.sp,
  );

  static TextStyle bodyRegular16_500_dark = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: ColorPalette.black,
  );
  static TextStyle bodyRegular16_400_dark = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: ColorPalette.black,
  );
  static TextStyle bodyRegular16_600_dark = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    color: ColorPalette.black,
  );

  static TextStyle bodyBold16_dark = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16.sp,
    color: ColorPalette.black,
  );

  static TextStyle bodyBold16_light = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16.sp,
    color: ColorPalette.white,
  );

  static TextStyle expenseBody = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: ColorPalette.expenseRed,
  );

  static TextStyle creditBody = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: ColorPalette.creditGreen,
  );

  // INTER  SEMI BOLD
  static TextStyle inSemiBold_14 = TextStyle(
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.005,
    color: ColorPalette.black, // You can customize the color
  );

  static TextStyle inSemiBold_16 = TextStyle(
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.005,
    color: ColorPalette.black, // You can customize the color
  );

  static TextStyle inH6Medium_greyscale = TextStyle(
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.005,
    color: ColorPalette.greyscale625, // You can customize the color
  );

  //====================Heading====================
  static TextStyle h1Dark_mr = TextStyle(
    fontSize: 24.0.sp,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.005,
    color: ColorPalette.black, // You can customize the color
  );
  static TextStyle h3Light_mr = TextStyle(
    fontSize: 20.0.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.005,
    color: ColorPalette.white, // You can customize the color
  );
  static TextStyle h3Light_in = TextStyle(
    fontSize: 20.0.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.005,
    color: ColorPalette.white, // You can customize the color
  );
  static TextStyle h2Dark_mr = TextStyle(
    fontSize: 20.0.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.005,
    color: ColorPalette.black, // You can customize the color
  );

  static TextStyle h5Dark_in = TextStyle(
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.005,
    color: ColorPalette.black, // You can customize the color
  );

  static TextStyle h3Dark_mr = TextStyle(
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.005,
    color: ColorPalette.black, // You can customize the color
  );

  static TextStyle h3BoldDark_mr = TextStyle(
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.005,
    color: ColorPalette.black, // You can customize the color
  );

  static TextStyle h32Light_mr = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w800,
    color: ColorPalette.greyscale50,
  );

  static TextStyle AppBarHeadingLight_mr = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
    color: ColorPalette.greyscale800,
  );

  static TextStyle h18DarkBold_mr = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: ColorPalette.black,
  );

  // =======================TEXTFIELD STYLE'S=======================
  static TextStyle primaryInputTextStyle = TextStyle(
    fontSize: 12.0.sp,
    letterSpacing: 0.005,
    fontWeight: FontWeight.w400,
    color: ColorPalette.black, // You can customize the color
  );

  static TextStyle primaryhintStyle = TextStyle(
    fontSize: 12.0.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.005,
    color: ColorPalette.greyscale600, // You can customize the color
  );

  // =======================BUTTON STYLE'S=======================
  static TextStyle primaryBtnTextStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: ColorPalette.white,
  );
}
