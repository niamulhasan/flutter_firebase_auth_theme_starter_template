import 'package:flutter/material.dart';

import '../views/layouts/auth_gurd.dart';
import '../views/screens/home/home_screen.dart';
import '../views/screens/login/login_screen.dart';
import 'error_route_screen.dart';

class RouteGenerator {
  static Route<dynamic> generate(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) =>
                const AuthGurd(isAuthProtected: true, widget: HomeScreen()));
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return errorRoute();
    }
  }
}
