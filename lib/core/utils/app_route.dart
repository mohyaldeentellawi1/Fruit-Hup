import 'package:flutter/material.dart';
import 'package:fruit_hup/screens/auth/forget_password_screen.dart';
import 'package:fruit_hup/screens/auth/login_screen.dart';
import 'package:fruit_hup/screens/auth/register_screen.dart';
import 'package:fruit_hup/screens/splashandboarding/boarding_screen.dart';
import 'package:fruit_hup/screens/splashandboarding/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case BoardingScreen.routeName:
      return MaterialPageRoute(builder: (context) => const BoardingScreen());
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case RegisterScreen.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterScreen());
    case ForgetPasswordScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const ForgetPasswordScreen(),
      );
    default:
      return MaterialPageRoute(
        builder:
            (_) => const Scaffold(body: Center(child: Text('404 Not Found'))),
      );
  }
}
