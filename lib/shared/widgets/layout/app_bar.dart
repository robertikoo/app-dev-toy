import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black),
        onPressed: () {
          // Add menu functionality here
        },
      ),
      title: Image.asset(
        'assets/logo_or_15.png',
        height: 40, // Adjust the height as needed
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined, color: Colors.black),
          onPressed: () {
            // Add notification functionality here
          },
        ),
      ],
    );
  }
}
