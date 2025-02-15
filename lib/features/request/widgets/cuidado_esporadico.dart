import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../shared/layouts/main_layout.dart';

class CuidadoEsporadicoWidget extends StatelessWidget {
  const CuidadoEsporadicoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBar: AppBar(title: const Text("Cuidado Esporádico")),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildHeader(), // ✅ Rectángulo con borde y contenido
              const SizedBox(height: 16),
              _buildOptionButton(Icons.location_on, "Dónde", "Dirección"),
              _buildOptionButton(Icons.calendar_today, "Cuándo", "Semana"),
              _buildOptionButton(Icons.access_time, "Hora", "Inicio - término"),
              _buildOptionButton(Icons.person, "Para quién", "Agregar niño o niña"),
              _buildOptionButton(Icons.edit, "Agregar nota", "Opcional"),
              const SizedBox(height: 20),
              SizedBox(
                width: 250, // Reducir el tamaño del botón
                child: OutlinedButton(
                  onPressed: () => _solicitarCuidado(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Solicitar Cuidado",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ Rectángulo con borde, icono SVG a la izquierda y texto con colores replicados
  Widget _buildHeader() {
    return Container(
      width: double.infinity, // Asegura que ocupe todo el ancho
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF4C44D4), // Color de fondo replicado
        borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
        border: Border.all(color: const Color(0xFF4C44D4), width: 2), // Borde con el mismo color
      ),
      child: Center( // Centrar el contenido
        child: Row(
          mainAxisSize: MainAxisSize.min, // El Row solo toma el espacio necesario
          children: [
            SvgPicture.asset(
              'assets/cuidado_esporadico.svg',
              height: 50, // Ajusta el tamaño del icono
            ),
            const SizedBox(width: 8), // Espacio entre el icono y el texto
            const Text(
              "Cuidado Esporádico",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Texto en blanco para resaltar
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Botón de opción con bordes más redondeados y etiquetas de texto
  Widget _buildOptionButton(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(20), // Mayor curvatura en los bordes
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(
          subtitle,
          style: TextStyle(
            fontWeight: FontWeight.w300, // Fuente más ligera
            color: Colors.grey[600], // Color gris más tenue
          ),
        ), // Mover la palabra a la derecha con estilo placeholder
        onTap: () {
          // Acción al tocar el botón
        },
      ),
    );
  }

  void _solicitarCuidado(BuildContext context) {
    // Lógica para solicitar cuidado
  }
}
