import 'package:flutter/material.dart';
import 'package:login_app/view/pages/error_page.dart';
import 'package:login_app/view/pages/login_page.dart';
import 'package:login_app/view/pages/main_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainPage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      default:
        return MaterialPageRoute(builder: (_) => ErrorPage());
    }
  }
}
