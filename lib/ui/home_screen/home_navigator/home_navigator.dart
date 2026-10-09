import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../../../core/app_color/app_color.dart';
import '../../save_screen/save_screen.dart';
import '../../search_screen/search_screen.dart';
import '../home_screen.dart';

class HomeNavBar extends StatefulWidget {
  const HomeNavBar({super.key});

  @override
  State<HomeNavBar> createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavBar> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    SearchScreen(),
    SaveScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        buttonBackgroundColor: const Color(0xFFFFA500),
        color: AppColor.primary_navy,
        height: 70,
        index: currentIndex,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: AppColor.white),
          Icon(Icons.search_sharp, size: 30, color: AppColor.white),
          Icon(Icons.bookmark_border_rounded, size: 30, color: AppColor.white),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
