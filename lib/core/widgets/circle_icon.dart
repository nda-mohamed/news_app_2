import 'package:flutter/material.dart';
import '../app_color/app_color.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({super.key, required this.icon, this.onPressed});

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColor.primary_navy,
      radius: 18,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: AppColor.white),
        iconSize: 20,
      ),
    );
  }
}
