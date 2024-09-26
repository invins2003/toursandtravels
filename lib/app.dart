import 'package:flutter/material.dart';
import 'package:toursandtravels/auth/Signin/login_page.dart';
import 'package:toursandtravels/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
       home:  LoginPage(),
    );
  }
}
