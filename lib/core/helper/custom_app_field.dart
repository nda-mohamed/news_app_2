import 'package:flutter/material.dart';
import '../app_color/app_color.dart';

class CustomAppField extends StatelessWidget {
  CustomAppField({
    super.key,
    required this.hint,
    this.suffixIcon,
    this.validator,
  });

  final String hint;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,

        suffixIcon: suffixIcon,

        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xFF999999),
        ),

        filled: true,

        fillColor: AppColor.white,

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE6E6E6)),
          borderRadius: BorderRadius.circular(10),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE6E6E6)),
        ),
      ),

      validator: (validator) {
        if (validator!.isEmpty || validator == null) {
          return 'Please enter your $hint';
        }
        return null;
      },
    );
  }
}
