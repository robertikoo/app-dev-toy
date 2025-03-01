import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/menu/home.svg',
            colorFilter: ColorFilter.mode(
              _selectedIndex == 0 ? const Color(0xFF02AAB6) : Colors.black,
              BlendMode.srcIn,
            ),
          ),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/menu/event.svg',
            colorFilter: ColorFilter.mode(
              _selectedIndex == 1 ? const Color(0xFF02AAB6) : Colors.black,
              BlendMode.srcIn,
            ),
          ),
          label: 'Calendario',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/menu/chat_bubble.svg',
            colorFilter: ColorFilter.mode(
              _selectedIndex == 2 ? const Color(0xFF02AAB6) : Colors.black,
              BlendMode.srcIn,
            ),
          ),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/menu/account_circle.svg',
            colorFilter: ColorFilter.mode(
              _selectedIndex == 3 ? const Color(0xFF02AAB6) : Colors.black,
              BlendMode.srcIn,
            ),
          ),
          label: 'Perfil',
        ),
      ],
    );
  }
}
