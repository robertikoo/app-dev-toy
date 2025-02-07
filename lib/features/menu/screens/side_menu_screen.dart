import 'package:flutter/material.dart';
import '../widgets/menu_list.dart';
import '../widgets/logout_button.dart';

class SideMenuScreen extends StatelessWidget {
  const SideMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Image.asset(
              'assets/logo_or_15.png',
              height: 40,
            ),
          ),
          const Expanded(
            child: MenuList(),
          ),
          const LogoutButton(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}