import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/layout/custom_nav_bar.dart';
import '../widgets/layout/app_bar.dart';
import '../../features/menu/screens/side_menu_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/calendar/screens/calendar_screen.dart';
import '../../features/chat/screens/chattray_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/request/screens/tipo_cuidado_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const CalendarScreen(),
    const ChatTrayScreen(),
    const ProfileScreen(),
    const CareTypeSelectionScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const SideMenuScreen(),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
      ),
    );
  }
}
