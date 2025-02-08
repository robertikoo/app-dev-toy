import 'package:flutter/material.dart';
import '../../../shared/layouts/main_layout.dart';

class CareTypeSelectionScreen extends StatelessWidget {
  const CareTypeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '¿Qué tipo de cuidado estás buscando?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            CareTypeButton(
              icon: Icons.calendar_today,
              text: 'Cuidado Permanente',
              backgroundColor: Colors.white,
              hoverColor: Colors.grey[200]!,
              textColor: const Color(0xFF4C44D4),
              borderColor: const Color(0xFF4C44D4),
            ),
            const SizedBox(height: 16),
            CareTypeButton(
              icon: Icons.volunteer_activism,
              text: 'Cuidado Esporádico',
              backgroundColor: const Color(0xFF4C44D4),
              hoverColor: const Color(0xFF6A63E0),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

// 🔹 Botón con efecto hover
class CareTypeButton extends StatefulWidget {
  final IconData icon;
  final String text;
  final Color backgroundColor;
  final Color hoverColor;
  final Color textColor;
  final Color? borderColor;

  const CareTypeButton({
    required this.icon,
    required this.text,
    required this.backgroundColor,
    required this.hoverColor,
    required this.textColor,
    this.borderColor,
    super.key,
  });

  @override
  _CareTypeButtonState createState() => _CareTypeButtonState();
}

class _CareTypeButtonState extends State<CareTypeButton> {
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
          color: isHovered ? widget.hoverColor : widget.backgroundColor,
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
