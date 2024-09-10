import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  static const TextTheme lightTextTheme = TextTheme(
    bodyLarge: TextStyle(color: Colors.black, fontFamily: 'Poppins'), // was bodyText1
    bodyMedium: TextStyle(color: Colors.black, fontFamily: 'Poppins'), // was bodyText2
    displayLarge: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 24), // was headline1
    headlineSmall: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 20), // was headline6
    // Add other text styles as needed
  );

  static const TextTheme darkTextTheme = TextTheme(
    bodyLarge: TextStyle(color: Colors.white, fontFamily: 'Poppins'), // was bodyText1
    bodyMedium: TextStyle(color: Colors.white, fontFamily: 'Poppins'), // was bodyText2
    displayLarge: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 24), // was headline1
    headlineSmall: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 20), // was headline6
    // Add other text styles as needed
  );
}
