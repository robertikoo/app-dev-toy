import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/welcome_header.dart';
import '../../../shared/layouts/main_layout.dart';
import 'package:app/features/request/screens/tipo_cuidado_screen.dart'; // Asegúrate de que la ruta sea correcta
import '../widgets/search_card.dart';
import 'package:dotted_border/dotted_border.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showButtons = false;
  String _searchQuery = "";

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
      _showButtons = query.isNotEmpty;

      if (query.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const CareTypeSelectionScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const WelcomeHeader(userName: 'Marcela'),
                      Image.asset('../../../../assets/user.png',
                          height: 40, width: 40),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text("Comencemos",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  // Franja con SearchCard ajustada al ancho completo
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: SearchCard(onSearchChanged: _onSearchChanged),
                  ),
                  const SizedBox(height: 16),
                  const Text("Eventos Próximos",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  _buildEventCard(),
                  const SizedBox(height: 16),
                  const Text("Solución a tus dudas!",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  _buildFeatureCard(
                    icon: Icons.support_agent,
                    text: 'Centro de ayuda',
                  ),
                  const SizedBox(height: 16),
                  const Text("Somos parte de un Equipo",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  _buildFeatureCardGuia(
                    icon: Icons.menu_book,
                    text: 'Guía de nuestro método',
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEventCard() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      dashPattern: [6, 3], // Ajusta el patrón de los puntos
      color: Colors.black,
      strokeWidth: 1,
      child: Container(
        width: double.infinity,
        height: 100, // Ajusta la altura según necesites
        alignment: Alignment.center, // Centrar el contenido
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centrar en el eje horizontal
          crossAxisAlignment:
              CrossAxisAlignment.center, // Centrar en el eje vertical
          children: [
            Icon(Icons.calendar_today, color: Colors.black),
            SizedBox(width: 8), // Espacio entre el icono y el texto
            Text(
              'No hay cuidados pendientes',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  // Tarjeta para "Centro de ayuda"
 

  Widget _buildFeatureCard({required IconData icon, required String text}) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 8),
          RichText(
            text: TextSpan(
              text: 'Centro de ', // Texto normal antes de "ayuda"
              style: TextStyle(fontSize: 16),
              children: [
                TextSpan(
                  text: 'ayuda', // La palabra "ayuda" en formato especial
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic, // Cursiva
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 



  // Tarjeta para "Guía de nuestro método"
  Widget _buildFeatureCardGuia({required IconData icon, required String text}) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
