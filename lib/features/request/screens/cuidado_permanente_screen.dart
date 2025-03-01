import 'package:flutter/material.dart';
import '../../../shared/widgets/layout/custom_nav_bar.dart';

class CuidadoPermanenteScreen extends StatelessWidget {
  const CuidadoPermanenteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Cuidado Permanente',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                // Add your Cuidado Permanente specific content here
              ],
            ),
          ),
        ),
      ),
    );
  }
} 