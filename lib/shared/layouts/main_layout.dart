import 'package:flutter/material.dart';
import '../widgets/layout/custom_nav_bar.dart';
import '../widgets/layout/app_bar.dart';
import '../../features/menu/screens/side_menu_screen.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  
  const MainLayout({
    super.key,
    required this.child,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const SideMenuScreen(),
      body: child,
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
} 