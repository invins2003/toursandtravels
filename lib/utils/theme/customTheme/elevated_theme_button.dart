// button_theme.dart
import 'package:flutter/material.dart';

class TButtonTheme {
  TButtonTheme._();

  static ElevatedButtonThemeData elevatedButtonTheme(Color primaryColor, Color onPrimaryColor) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: onPrimaryColor, 
        backgroundColor: primaryColor, // Text color
        textStyle: const TextStyle(fontFamily: 'Poppins'),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
