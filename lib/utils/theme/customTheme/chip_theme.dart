// chip_theme.dart
import 'package:flutter/material.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    backgroundColor: Colors.grey.shade200,
    selectedColor: Colors.black,
    disabledColor: Colors.grey.shade300,
    labelStyle: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
    secondaryLabelStyle: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    backgroundColor: Colors.grey.shade800,
    selectedColor: Colors.white,
    disabledColor: Colors.grey.shade700,
    labelStyle: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
    secondaryLabelStyle: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
}
