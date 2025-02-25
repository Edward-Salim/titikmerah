import 'package:flutter/material.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/auth/login_selection_screen.dart';
import '../screens/auth/phone_login_screen.dart';
import '../screens/home_screen.dart';

class AppRoutes {
  static const String initialRoute = '/';

  static Map<String, WidgetBuilder> routes = {
    '/': (context) => SplashScreen(),
    '/login': (context) => LoginSelectionScreen(),
    '/phoneLogin': (context) => PhoneLoginScreen(),
    '/home': (context) => HomeScreen(),
  };
}
