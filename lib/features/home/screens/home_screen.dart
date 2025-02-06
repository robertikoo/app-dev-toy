import 'package:flutter/material.dart';
import '../widgets/welcome_header.dart';
import '../widgets/search_card.dart';
import '../widgets/feature_card.dart';
import '../../../shared/layouts/main_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            WelcomeHeader(userName: 'Marcela'),
            SizedBox(height: 16),
            SearchCard(),
            SizedBox(height: 16),
            FeatureCard(
              title: 'Eventos',
              subtitle: 'Descubre los próximos eventos',
              variant: FeatureCardVariant.dashed,
            ),
            SizedBox(height: 16),
            FeatureCard(
              title: 'Centro de Ayuda',
              subtitle: '¿Necesitas ayuda? Estamos aquí para ti',
              variant: FeatureCardVariant.outlined,
            ),
            SizedBox(height: 16),
            FeatureCard(
              title: 'Guía de Inicio',
              subtitle: 'Aprende a usar la aplicación',
              variant: FeatureCardVariant.outlined,
            ),
          ],
        ),

      ),
    );
  }
}
