import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CuidadoHeader extends StatelessWidget {
  const CuidadoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF4C44D4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/cuidado_esporadico.svg',
            height: 50,
          ),
          const SizedBox(width: 8),
          const Text(
            "Cuidado Esporádico",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
} 