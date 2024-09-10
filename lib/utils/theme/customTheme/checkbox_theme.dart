// checkbox_theme.dart
import 'package:flutter/material.dart';

class TCheckboxTheme {
  TCheckboxTheme._();

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    fillColor: MaterialStateProperty.all(Colors.black),
    checkColor: MaterialStateProperty.all(Colors.white),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  );

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    fillColor: MaterialStateProperty.all(Colors.white),
    checkColor: MaterialStateProperty.all(Colors.black),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  );
}
