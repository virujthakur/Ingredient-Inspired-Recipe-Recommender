import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) navigateBottomBar;

  const MyNavbar({
    super.key,
    required this.selectedIndex,
    required this.navigateBottomBar
  });

  @override
  Widget build(BuildContext context) {
    return GNav(
      gap: 8,
      selectedIndex: selectedIndex,
      onTabChange: navigateBottomBar,
      tabs: const [
        GButton(
          icon: Icons.home,
          text: 'Home' ,
        ),
        GButton(
          icon: Icons.favorite,
          text: 'Likes',
        ),
        GButton(
            icon: Icons.camera_alt,
            text: 'Capture'),
        GButton(
          icon: Icons.settings,
          text: 'Settings',
        )
      ],
    );
  }
}
