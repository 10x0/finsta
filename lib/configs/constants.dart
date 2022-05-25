import 'package:flutter/material.dart';

class Colour {
  static String red = 'red';
}

class Navigation {
  static final key = GlobalKey<NavigatorState>();
  static const String home = '/home';
  static const String register = '/register';
  static const String login = '/login';
}

class ApiServiceConstants {
  static String baseURL = 'https://13b8-103-10-31-102.in.ngrok.io';
  static String posts = 'api/v1/post';
}
