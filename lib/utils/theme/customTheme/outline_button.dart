// outlined_button_theme.dart
import 'package:flutter/material.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static OutlinedButtonThemeData outlinedButtonTheme(Color borderColor, Color textColor) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: textColor, side: BorderSide(color: borderColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: TextStyle(fontFamily: 'Poppins'),
      ),
    );
  }

  static OutlinedButtonThemeData lightOutlinedButtonTheme = outlinedButtonTheme(Colors.black, Colors.black);
  static OutlinedButtonThemeData darkOutlinedButtonTheme = outlinedButtonTheme(Colors.white, Colors.white);
}
