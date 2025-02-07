import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });

        switch (index) {
          case 0:
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
            break;
          case 1:
            Navigator.pushNamedAndRemoveUntil(
                context, '/calendar', (route) => false);
            break;
          case 2:
            Navigator.pushNamedAndRemoveUntil(
                context, '/chat', (route) => false);
            break;
          case 3:
            Navigator.pushNamedAndRemoveUntil(
                context, '/profile', (route) => false);
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
