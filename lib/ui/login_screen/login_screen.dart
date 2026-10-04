import 'package:flutter/material.dart';
import 'package:news_app_2/core/helper/custom_app_button.dart';
import '../../core/app_color/app_color.dart';
import '../../core/helper/custom_app_field.dart';
import '../home_screen/home_screen.dart';
import '../signup_screen/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(backgroundColor: AppColor.white, toolbarHeight: 0),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Login to your account',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1A1A),
              ),
            ),

            Text(
              'It’s great to see you again.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF808080),
              ),
            ),

            SizedBox(height: 30),

            Text(
              'User Name',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A1A1A),
              ),
            ),

            CustomAppField(hint: 'Enter your email address'),

            SizedBox(height: 20),

            Text(
              'Password',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A1A1A),
              ),
            ),

            CustomAppField(
              hint: 'Enter your email address',
              suffixIcon: Icon(
                Icons.visibility_off_outlined,
                color: Color(0xFF999999),
              ),
            ),

            SizedBox(height: 60),

            CustomAppButton(text: 'Sign In', onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            }),

            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColor.gray,
                  ),
                ),

                SizedBox(width: 5),

                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: Text(
                    'Join',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
