import 'package:flutter/material.dart';
import 'package:news_app_2/ui/home_details_screen/home_details_screen.dart';
import 'package:news_app_2/ui/home_screen/home_screen.dart';
import 'package:news_app_2/ui/login_screen/login_screen.dart';
import 'package:news_app_2/ui/signup_screen/signup_screen.dart';
import 'package:news_app_2/ui/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}