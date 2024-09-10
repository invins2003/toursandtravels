import 'package:flutter/material.dart';
import 'package:toursandtravels/utils/constant/colors.dart';
import 'package:toursandtravels/utils/theme/customTheme/appbar_theme.dart';
import 'package:toursandtravels/utils/theme/customTheme/bottom_navbar.dart';
import 'package:toursandtravels/utils/theme/customTheme/bottomsheet_theme.dart';
import 'package:toursandtravels/utils/theme/customTheme/checkbox_theme.dart';
import 'package:toursandtravels/utils/theme/customTheme/chip_theme.dart';
import 'package:toursandtravels/utils/theme/customTheme/elevated_theme_button.dart';
import 'package:toursandtravels/utils/theme/customTheme/outline_button.dart';
import 'package:toursandtravels/utils/theme/customTheme/text_theme.dart';
import 'package:toursandtravels/utils/theme/customTheme/textfield_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: TColors.primaryLight,
      secondary: TColors.secondaryLight,
      surface: TColors.scaffoldBackgroundLight,
      background: TColors.scaffoldBackgroundLight,
      error: Colors.red,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
    ),
    textTheme: TTextTheme.lightTextTheme,
    scaffoldBackgroundColor: TColors.scaffoldBackgroundLight,
    elevatedButtonTheme: TButtonTheme.elevatedButtonTheme(TColors.accentLight, Colors.black),
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    chipTheme: TChipTheme.lightChipTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme,
    bottomNavigationBarTheme:TBottomNavBarTheme.lightBottomNavBarTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: TColors.primaryDark,
      secondary: TColors.secondaryDark,
      surface: TColors.scaffoldBackgroundDark,
      background: TColors.scaffoldBackgroundDark,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onBackground: Colors.white,
      onError: Colors.white,
    ),
    textTheme: TTextTheme.darkTextTheme,
    scaffoldBackgroundColor: TColors.primaryDark,
    elevatedButtonTheme: TButtonTheme.elevatedButtonTheme(TColors.accentDark, Colors.white),
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    chipTheme: TChipTheme.darkChipTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.darkInputDecorationTheme,
    bottomNavigationBarTheme:TBottomNavBarTheme.darkBottomNavBarTheme
  );
}
