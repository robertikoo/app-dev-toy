import 'package:app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/outlined_button.dart';

class Welcome2Screen extends StatelessWidget {
  const Welcome2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/logo.svg',
              width: 300,
              height: 150,
            ),
            const SizedBox(height: 200),
            CustomOutlinedButton(
              text: 'Iniciar sesión',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },

            ),
            const SizedBox(height: 20),
            CustomOutlinedButton(
              text: 'Registrarse',
              onPressed: () {
                // Add your button action here
              },

            ),
          ],
        ),
      ),
    );
  }
}
