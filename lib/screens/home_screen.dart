import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // Acción al presionar el ícono de menú
          },
        ),
        title: Center(
          child: Image.asset(
            'assets/logo_or_15.png',
            height: 40,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Acción al presionar el ícono de notificaciones
            },
          ),
          const SizedBox(width: 16), // Espacio para centrar la imagen
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido horizontalmente
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Bienvenid@ ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: 'Marcela',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10), // Espacio entre el texto y el avatar
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[200],
                  child: const Icon(Icons.person, size: 24, color: Colors.grey),
                ),
              ],
            ),
          ),

          // Espacio adicional entre los cuadros
          SizedBox(height: 16),

          // Ajustamos el recuadro de búsqueda para incluir el texto encima
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              clipBehavior: Clip.none, // Permite que el texto salga del área del contenedor
              children: [
                Card(
                  color: Colors.grey[300],
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[400],
                      child: const Icon(Icons.search, color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Borde redondeado
                      side: BorderSide(
                        color: Colors.grey.shade400,
                        width: 1, // Borde gris claro
                      ),
                    ),
                    title: Row(
                      children: [
                        Text(
                          'Buscar',
                          style: TextStyle(
                            fontWeight: FontWeight.w600, // Peso extra bold
                            color: const Color.fromARGB(255, 0, 0, 0), // Gris oscuro
                          ),
                        ),
                        const SizedBox(width: 5), // Espacio entre los textos
                        Text(
                          'Cuidado',
                          style: TextStyle(
                            fontWeight: FontWeight.w900, // Peso extra bold
                            color: Colors.black, // Negro fuerte
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -28, // Más margen en la parte superior
                  left: 8, // Ajusta hacia la izquierda para respetar el orden del cuadro
                  child: Text(
                    'Comencemos',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Espacio adicional entre los cuadros
          SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              clipBehavior: Clip.none, // Permite que el texto salga del área del contenedor
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CustomPaint(
                    painter: DashedBorderPainter(),
                    child: Card(
                      elevation: 0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[400],
                          child: const Icon(Icons.calendar_month, color: Colors.white),
                        ),
                        title: Text('No hay cuidados pendientes',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -28, // Más margen en la parte superior
                  left: 8, // Ajusta hacia la izquierda para respetar el orden del cuadro
                  child: Text(
                    'Eventos próximos',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Espacio adicional entre los cuadros
          SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              clipBehavior: Clip.none, // Permite que el texto salga del área del contenedor
              children: [
                Card(
                  color: Colors.white,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[400],
                      child: const Icon(Icons.search, color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Borde redondeado
                      side: BorderSide(
                        color: Colors.grey.shade400,
                        width: 1, // Borde gris claro
                      ),
                    ),
                    title: Row(
                      children: [
                        Text(
                          'Centro de',
                          style: TextStyle(
                            fontWeight: FontWeight.w600, // Peso extra bold
                            color: const Color.fromARGB(255, 0, 0, 0), // Gris oscuro
                          ),
                        ),
                        const SizedBox(width: 5), // Espacio entre los textos
                        Text(
                          'ayuda',
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // Peso extra bold
                            fontStyle: FontStyle.italic,
                            color: Colors.black, // Negro fuerte
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -28, // Más margen en la parte superior
                  left: 8, // Ajusta hacia la izquierda para respetar el orden del cuadro
                  child: Text(
                    'Solución a tus dudas',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Espacio adicional entre los cuadros
          SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              clipBehavior: Clip.none, // Permite que el texto salga del área del contenedor
              children: [
                Card(
                  color: Colors.white,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[400],
                      child:
                          const Icon(Icons.calendar_month, color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Borde redondeado
                      side: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1), // Borde gris claro
                    ),
                    title: Text('Guía de nuestro método',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                Positioned(
                  top: -28, // Más margen en la parte superior
                  left: 8, // Ajusta hacia la izquierda para respetar el orden del cuadro
                  child: Text(
                    'Somos parte de un equipo',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 5;
    const dashSpace = 3;
    double startX = 0;
    final path = Path();

    // Dibuja el borde superior
    while (startX < size.width) {
      path.moveTo(startX, 0);
      path.lineTo(startX + dashWidth, 0);
      startX += dashWidth + dashSpace;
    }

    // Dibuja el borde derecho
    double startY = 0;
    while (startY < size.height) {
      path.moveTo(size.width, startY);
      path.lineTo(size.width, startY + dashWidth);
      startY += dashWidth + dashSpace;
    }

    // Dibuja el borde inferior
    startX = size.width;
    while (startX > 0) {
      path.moveTo(startX, size.height);
      path.lineTo(startX - dashWidth, size.height);
      startX -= dashWidth + dashSpace;
    }

    // Dibuja el borde izquierdo
    startY = size.height;
    while (startY > 0) {
      path.moveTo(0, startY);
      path.lineTo(0, startY - dashWidth);
      startY -= dashWidth + dashSpace;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
