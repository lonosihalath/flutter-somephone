import 'package:flutter/material.dart';

class AppColors {
  static Color kPrimaryColor = const Color(0xFFEE1C27);
  static Color kshadowRes = const Color(0xFFFDE7E8);
  static Color kbottomBar = const Color(0xFFF24B53);
  static Color kIconBar = const Color(0xFFF5757C);
  static Color kShoftRed = const Color(0xFFFDE7E8);
  static Color kShoftGreen = const Color(0xFFCBFBDD);
  static Color kTextPayment = const Color(0xFF0A7F37);
  static Color kD9 = const Color(0xFFD9D9D9);
  static Color kED = const Color(0xFFEDEDED);
  static Color kF7 = const Color(0xFFF7F7F7);
  static Color k6 = const Color(0xFF666666);
  static Color kCarregistration = const Color(0xFFFFC700);
  static Color ktext = const Color(0XFF161515);
  static Color kheadContract = const Color(0XFFE1E1E1);

  static const int _kLight = 0xFFFFFFFF;
  static const MaterialColor kLigth = MaterialColor(
    _kLight,
    <int, Color>{
      50: Color(_kLight),
      100: Color.fromRGBO(250, 250, 250, 1),
      200: Color.fromRGBO(245, 245, 245, 1),
      300: Color.fromRGBO(240, 240, 240, 1),
      400: Color.fromRGBO(222, 222, 222, 1),
      500: Color.fromRGBO(194, 194, 194, 1),
      600: Color.fromRGBO(151, 151, 151, 1),
      700: Color.fromRGBO(129, 129, 129, 1),
      800: Color.fromRGBO(96, 96, 96, 1),
      900: Color.fromRGBO(60, 60, 60, 1),
    },
  );
  static Color kBlack = const Color(0xFF000000);
  static Color kTextOrther = const Color(0xFF282929);
  static Color kTextDetail = const Color(0xFF878787);
  static Color kGley = const Color(0xFFA8A8A8);
  static Color kBackground = const Color(0xFFF6F8FC);
  static Color kTextInput = const Color(0XFFB7B7B7);
  static Color kTextBlack = const Color(0XFF161515);
  static const Color colorSuccess = Color(0xFF12c06a);
  static const Color colorInfo = Color(0xFF0e66d0);
  static const Color colorWarning = Color(0xFFeb8600);
  static const Color colorError = Color(0xFFd00e0e);
  static const Color dialogSuccess = Color(0xFFE3FDED);
  static const Color dialogWarning = Color(0xFFFFF9E5);
  static const Color dialogError = Color(0xFFFDE7E8);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
