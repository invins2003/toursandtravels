// appbar_theme.dart
import 'package:flutter/material.dart';
import 'package:toursandtravels/utils/theme/customTheme/text_theme.dart';


class TAppBarTheme {
  TAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    color: Color.fromARGB(255, 255, 255, 255), // primaryLight
    titleTextStyle: TTextTheme.lightTextTheme.headlineSmall,
    iconTheme: const IconThemeData(color: Colors.black),
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    color: const Color(0xFF222831), // primaryDark
    titleTextStyle: TTextTheme.darkTextTheme.headlineSmall,
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
