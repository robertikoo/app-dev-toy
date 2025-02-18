import 'package:flutter/material.dart';
import '../../../shared/layouts/main_layout.dart';
import 'package:app/features/home/screens/home_screen.dart'; // Asegúrate de tener esta pantalla importada
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/features/request/widgets/cuidado_esporadico.dart';


class CareTypeSelectionScreen extends StatelessWidget {
  const CareTypeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alineado a la izquierda
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    // Navegar hacia la pantalla de inicio
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()), // Aquí navegas a HomeScreen
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              '¿Qué tipo de cuidado estás buscando?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            CareTypeButton(
              icon: SvgPicture.asset('assets/cuidado_permanente.svg'),  // Passing SvgPicture
              text: 'Cuidado Permanente',
              backgroundColor: Colors.white,
              hoverColor: Colors.grey[200]!,
              textColor: const Color(0xFF4C44D4),
              borderColor: const Color(0xFF4C44D4),
            ),
            const SizedBox(height: 16),
       CareTypeButton(
  icon: SvgPicture.asset('assets/cuidado_esporadico.svg'),
  text: 'Cuidado Esporádico',
  backgroundColor: const Color(0xFF4C44D4),
  hoverColor: const Color(0xFF6A63E0),
  textColor: Colors.white,
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CuidadoEsporadicoWidget()),
    );
  },
),

          ],
        ),
      ),
    );
  }
}
class CareTypeButton extends StatefulWidget {
  final Widget icon;
  final String text;
  final Color backgroundColor;
  final Color hoverColor;
  final Color textColor;
  final Color? borderColor;
  final VoidCallback? onPressed; // <-- Agregamos el onPressed

  const CareTypeButton({
    required this.icon,
    required this.text,
    required this.backgroundColor,
    required this.hoverColor,
    required this.textColor,
    this.borderColor,
    this.onPressed, // <-- Añadimos el onPressed aquí
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
      child: GestureDetector(
        onTap: widget.onPressed, // <-- Ahora puede ejecutar la función
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
              widget.icon,
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
      ),
    );
  }
}
