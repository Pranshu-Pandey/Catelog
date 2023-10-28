import 'package:catalog/pages/homepage.dart';
import 'package:catalog/pages/loginpage.dart';
import 'package:catalog/utils/routes.dart';
import 'package:catalog/widgets/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Mytheme.themeData,
      initialRoute: Myroutes.homeRoute,
      routes: {
        "/": (context) => const HomePage(),
        Myroutes.loginRoute: (context) => const LoginPage(),
        Myroutes.homeRoute: (context) => HomePage(),
      },
    );
  }
}
