import 'package:finsta/configs/constants.dart';
import 'package:finsta/configs/routes.dart';
import 'package:finsta/configs/themes.dart';
import 'package:finsta/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finsta',
      theme: Themes.light(context),
      darkTheme: Themes.dark(context),
      home: const LoginScreen(),
      onGenerateRoute: generateRoutes,
      navigatorKey: Navigation.key,
    );
  }
}
