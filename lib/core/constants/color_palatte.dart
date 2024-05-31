import 'package:flutter/material.dart';

class ColorPalette {
  //!======================MAIN=============================

  // ========================PRIMARY=============================
  static const Color primary = Color.fromRGBO(84, 58, 248, 1);
  static const Color primary400 = Color.fromRGBO(178, 166, 252, 1);
  static const Color primary300 = Color.fromRGBO(144, 127, 250, 1);
  static const Color primary200 = Color.fromRGBO(208, 201, 253, 1);
  static const Color primary100 = Color.fromRGBO(225, 221, 254, 1);
  static const Color primary50 = Color.fromRGBO(240, 238, 254, 1);
  static const Color primaryGradientDark = Color(0xFF2A13BF);

  // ========================SECONDARY=============================
  static const Color secondary = Color.fromRGBO(36, 69, 205, 1);
  static const Color secondary400 = Color.fromRGBO(138, 157, 240, 1);
  static const Color secondary300 = Color.fromRGBO(172, 187, 243, 1);
  static const Color secondary200 = Color.fromRGBO(208, 216, 245, 1);
  static const Color secondary100 = Color.fromRGBO(227, 231, 247, 1);
  static const Color secondary50 = Color.fromRGBO(245, 247, 254, 1);

  //! =======================ALERT'S COLORS=============================

  // ==========================SUCCESS==================================
  static const Color success = Color.fromRGBO(40, 161, 56, 1);
  static const Color successLight = Color.fromRGBO(64, 221, 127, 1);

  // ==========================WARNING==================================
  static const Color warning =
      Color.fromRGBO(223, 123, 0, 1); //rgba(223, 123, 0, 1)
  static const Color warningLight = Color.fromRGBO(255, 188, 31, 1);

  // ==========================ERROR====================================
  static const Color error =
      Color.fromRGBO(210, 28, 28, 1); //rgba(210, 28, 28, 1)
  static const Color errorLight = Color.fromRGBO(255, 98, 98, 1);

  //!===========================ADDITIONAL=============================
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color lightGrey = Color.fromRGBO(232, 232, 235, 1);
  static const Color grey = Color.fromRGBO(50, 48, 69, 1);

  static const Color blue = Color.fromRGBO(66, 103, 178, 1);
  static const Color darkBlue = Color.fromRGBO(49, 40, 100, 1);
  static const Color purple = Color.fromRGBO(121, 112, 175, 1);
  static const Color black = Color.fromRGBO(21, 20, 31, 1);
  static const Color darkBackground = Color(0xFF1D222A);
  static const Color expenseRed = Color.fromRGBO(233, 60, 60, 1);
  static const Color creditGreen = Color.fromRGBO(26, 183, 89, 1);
  static const Color redAccent = Color.fromRGBO(248, 236, 236, 1);

  //!==========================GRAYSCALE=============================
  static const Color greyscale50 = Color.fromRGBO(249, 249, 250, 1);
  static const Color greyscale75 = Color.fromRGBO(244, 244, 246, 1);
  static const Color greyscale100 = Color.fromRGBO(232, 232, 232, 1);
  static const Color greyscale200 = Color.fromRGBO(220, 219, 224, 1);
  static const Color greyscale300 = Color.fromRGBO(225, 225, 225, 1);
  static const Color greyscale400 = Color.fromRGBO(204, 202, 207, 1);
  static const Color greyscale500 = Color.fromRGBO(204, 203, 205, 1);
  static const Color greyscale600 = Color.fromRGBO(162, 160, 168, 1);
  static const Color greyscale625 = Color.fromRGBO(156, 164, 171, 1);
  static const Color greyscale650 = Color.fromRGBO(113, 129, 147, 1);
  static const Color greyscale700 = Color.fromRGBO(82, 82, 92, 1);
  static const Color greyscale800 = Color.fromRGBO(33, 31, 50, 1);

  //!==========================GRADIENTS=============================
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [ColorPalette.primary, ColorPalette.primaryGradientDark],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
