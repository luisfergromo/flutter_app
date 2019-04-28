import 'package:flutter/material.dart';
import 'package:my_app/views/AboutPage.dart';
import 'package:my_app/views/HomePage.dart';
import 'package:my_app/views/Login.dart';
import 'package:my_app/views/RegistrationPage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/home':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => HomePage(
                  // data: args,
                  ));
        }
        return _errorRoute();
      case '/about':
        return MaterialPageRoute(builder: (_) => About());
      case '/registration':
        return MaterialPageRoute(builder: (_) => RegistrationPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
