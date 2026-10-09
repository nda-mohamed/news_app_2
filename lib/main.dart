import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_2/ui/home_screen/home_cubit.dart';
import 'package:news_app_2/ui/home_screen/home_navigator/home_navigator.dart';
import 'package:news_app_2/ui/login_screen/login_screen.dart';
import 'package:news_app_2/ui/signup_screen/signup_screen.dart';
import 'package:news_app_2/ui/splash_screen/splash_screen.dart';
import 'core/app_routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(query: null),
      child: MaterialApp(
        title: 'News App',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.SplashScreen.name,
        routes: {
          AppRoutes.SplashScreen.name: (context) => const SplashScreen(),
          AppRoutes.LoginScreen.name: (context) => const LoginScreen(),
          AppRoutes.SignupScreen.name: (context) => const SignupScreen(),
          AppRoutes.HomeNavBar.name: (context) => const HomeNavBar(),
        }
      ),
    );
  }
}