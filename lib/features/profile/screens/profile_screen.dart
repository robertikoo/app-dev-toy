import 'package:flutter/material.dart';
import '../../../shared/layouts/main_layout.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      child: Center(
        child: Text('Profile Screen'),
      ),
    );
  }
} 