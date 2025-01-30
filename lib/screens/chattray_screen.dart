import 'package:flutter/material.dart';

class BandejaScreen extends StatelessWidget {
  const BandejaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Cambiar SvgPicture por Image.asset
            Image.asset(
              'assets/logo_or_15.PNG',  // Asegúrate de que la ruta sea correcta
              width: 50,
              height: 100,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ChoiceChip(label: const Text('Recientes'), selected: true),
                const SizedBox(width: 8),
                ChoiceChip(label: const Text('Ayer'), selected: false),
                const SizedBox(width: 8),
                ChoiceChip(label: const Text('No leídos (2)'), selected: false),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Card(
                    color: index == 0 ? Colors.grey[300] : Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[400],
                        child: const Icon(Icons.image, color: Colors.white),
                      ),
                      title: Text(index == 0 ? 'Emilio Sandoval' : 'Nombre Apellido',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          index == 0 ? 'Hace 1 hora' : 'Hace ${4 + index * 6} horas'),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Chat'),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
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
