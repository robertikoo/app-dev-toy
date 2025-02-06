import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../shared/widgets/outlined_button.dart';
import 'welcome2_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
              text: 'Empezar',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Welcome2Screen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
