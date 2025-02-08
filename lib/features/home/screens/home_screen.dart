import 'package:flutter/material.dart';
import '../widgets/welcome_header.dart';
import '../widgets/search_card.dart';
import '../widgets/feature_card.dart';
import '../../../shared/layouts/main_layout.dart';
import 'package:app/features/request/screens/tipo_cuidado_screen.dart'; // Asegúrate de que la ruta sea correcta

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const WelcomeHeader(userName: 'Marcela'),
            const SizedBox(height: 16),
            const SearchCard(),
            const SizedBox(height: 16),
            const FeatureCard(
              title: 'Eventos',
              subtitle: 'Descubre los próximos eventos',
              variant: FeatureCardVariant.dashed,
            ),
            const SizedBox(height: 16),
            const FeatureCard(
              title: 'Centro de Ayuda',
              subtitle: '¿Necesitas ayuda? Estamos aquí para ti',
              variant: FeatureCardVariant.outlined,
            ),
            const SizedBox(height: 16),
            const FeatureCard(
              title: 'Guía de Inicio',
              subtitle: 'Aprende a usar la aplicación',
              variant: FeatureCardVariant.outlined,
            ),
            const SizedBox(height: 16),
            // Vista previa del tipo de cuidado con efecto hover
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CareTypeSelectionScreen()),
                );
              },
              child: Column(
                children: [
                  HoverEffectButton(
                    text: 'Cuidado Permanente',
                    icon: Icons.calendar_today,
                    defaultColor: Colors.white,
                    hoverColor: Colors.grey[200]!, // Cambio sutil en hover
                    textColor: const Color(0xFF4C44D4),
                    borderColor: const Color(0xFF4C44D4),
                  ),
                  const SizedBox(height: 16),
                  HoverEffectButton(
                    text: 'Cuidado Esporádico',
                    icon: Icons.volunteer_activism,
                    defaultColor: const Color(0xFF4C44D4),
                    hoverColor: const Color(0xFF6A63E0), // Color más claro en hover
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 🔹 Widget reutilizable con efecto hover
class HoverEffectButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final Color defaultColor;
  final Color hoverColor;
  final Color textColor;
  final Color? borderColor;

  const HoverEffectButton({
    required this.text,
    required this.icon,
    required this.defaultColor,
    required this.hoverColor,
    required this.textColor,
    this.borderColor,
    super.key,
  });

  @override
  _HoverEffectButtonState createState() => _HoverEffectButtonState();
}

class _HoverEffectButtonState extends State<HoverEffectButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isHovered ? widget.hoverColor : widget.defaultColor,
          borderRadius: BorderRadius.circular(12),
          border: widget.borderColor != null ? Border.all(color: widget.borderColor!) : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.icon, color: widget.textColor, size: 24),
            const SizedBox(width: 8),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: widget.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
