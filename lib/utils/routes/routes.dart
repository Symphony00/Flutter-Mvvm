import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_Names.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/login_screen.dart';
import 'package:mvvm/view/signup_screen.dart';
import 'package:mvvm/view/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashScreen());

      case RoutesNames.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      case RoutesNames.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
      case RoutesNames.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("NO Routes Defined"),
            ),
          );
        });
    }
  }
}
