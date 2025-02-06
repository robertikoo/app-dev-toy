import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Get current route to highlight the correct tab
    final String currentRoute = ModalRoute.of(context)?.settings.name ?? '/home';
    
    return BottomNavigationBar(
      currentIndex: _getSelectedIndex(currentRoute),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/home');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/chat');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/profile');
            break;
        }
      },
    );
  }

  int _getSelectedIndex(String currentRoute) {
    switch (currentRoute) {
      case '/home':
        return 0;
      case '/chat':
        return 1;
      case '/profile':
        return 2;
      default:
        return 0;
    }
  }
}