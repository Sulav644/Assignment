import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    double size = 26;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GNav(
        gap: 0,
        selectedIndex: 2,
        tabBackgroundColor: const Color.fromARGB(255, 26, 119, 196),
        padding: const EdgeInsets.all(14),
        activeColor: Colors.white,
        color: const Color.fromARGB(255, 61, 59, 59),
        tabs: [
          GButton(
            icon: Icons.equalizer_outlined,
            iconSize: size,
          ),
          GButton(icon: Icons.notification_add_outlined, iconSize: size),
          GButton(icon: Icons.search_outlined, iconSize: size),
          GButton(icon: Icons.chat_outlined, iconSize: size),
          GButton(icon: Icons.star_outline, iconSize: size),
        ],
      ),
    );
  }
}
