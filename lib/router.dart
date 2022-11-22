import 'package:flutter/material.dart';
import 'package:hive_test/username.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'main.dart';
const String splashRoute = '/';
const String loginPage = '/loginScreen';
const String homePage = '/homeScreen';
const String usernamePage = '/userName';


class Router {
  var code;
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginPage:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case usernamePage:
        return MaterialPageRoute(builder: (_) => const UserName());

    }
    return generateRoute(settings)as Route<dynamic>;
  }}