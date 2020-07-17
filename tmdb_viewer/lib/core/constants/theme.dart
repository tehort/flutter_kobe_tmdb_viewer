import 'package:flutter/material.dart';

enum ThemeType { light, dark }

mixin AppTheme {
  static ThemeType themeType = ThemeType.light;

  static final primarySwatch = MaterialColor(
    4280374937,
    {
      50: Color(0xffe1e7ec),
      100: Color(0xffb3c4cf),
      200: Color(0xff819db0),
      300: Color(0xff4f7690),
      400: Color(0xff295878),
      500: Color(0xff033B60),
      600: Color(0xff033558),
      700: Color(0xff022d4e),
      800: Color(0xff022644),
      900: Color(0xff011933)
    },
  );

  // Progress Hud
  static final progressHudColor = primarySwatch.shade500;

  // Forms background
  static final pageBackgroundColor = Colors.grey.shade300;

  // Text
  static final textColor = Colors.white;

  // TextField
  static final textFieldFillColor = Colors.white;
  static final textFieldTextColor = primarySwatch.shade700;

  // Text Listagem Guia
  static final textListagemGuiaTituloColor = primarySwatch.shade600;
  static final textListagemGuiaDescColor = primarySwatch.shade700;

  // Buttons
  static final buttonColor = primarySwatch.shade500;
  static final buttonTextColor = Colors.grey.shade200;

  // App Bar
  static final appBarBackground = primarySwatch.shade500;

  // Bottom Navigation Bar
  static final bottomNavigationBackground = primarySwatch.shade500;
  static final bottomNavigationSelected = Colors.white;
  static final bottomNavigationUnselected = Colors.white54;

  // Dialogs
  static TextStyle styleAlertHeaderText() =>
      TextStyle(fontSize: 20.0, color: Colors.grey.shade800);
  static TextStyle styleAlertBodyText() =>
      TextStyle(fontSize: 16.0, color: Colors.grey.shade700);
  static TextStyle styleAlertButtonText() =>
      TextStyle(fontSize: 18.0, color: Colors.grey.shade800);
}
