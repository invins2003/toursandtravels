// bottomsheet_theme.dart
import 'package:flutter/material.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    elevation: 10.0,
  );

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    backgroundColor: Color(0xFF222831),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    elevation: 10.0,
  );
}
