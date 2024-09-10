import 'package:flutter/material.dart';
import 'package:toursandtravels/utils/constant/colors.dart';

class TBottomNavBarTheme {
  TBottomNavBarTheme._();

  static const lightBottomNavBarTheme = BottomNavigationBarThemeData(
    backgroundColor: TColors.scaffoldBackgroundLight,
    selectedItemColor: TColors.accentLight,
    unselectedItemColor: TColors.secondaryLight,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  );

  static const darkBottomNavBarTheme = BottomNavigationBarThemeData(
    backgroundColor: TColors.primaryDark,
    selectedItemColor: TColors.accentDark,
    unselectedItemColor: TColors.primaryLight,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  );
}