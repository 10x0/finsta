import 'package:finsta/configs/constants.dart';
import 'package:finsta/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

Route generateRoutes(RouteSettings settings) {
  // final args = settings.arguments;

  switch (settings.name) {
    case Navigation.home:
      return buildRoute(settings, const HomeScreen());
    case Navigation.register:
      return buildRoute(settings, const RegisterScreen());
    case Navigation.login:
      return buildRoute(settings, const LoginScreen());
    default:
      return buildRoute(settings, const LoginScreen());
  }
}

MaterialPageRoute buildRoute(RouteSettings settings, Widget widget) {
  return MaterialPageRoute(
    settings: settings,
    builder: (BuildContext context) => widget,
  );
}
