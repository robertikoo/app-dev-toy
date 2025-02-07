import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:app/features/calendar/widgets/event.dart'; // Ajusta la importación
import 'package:app/features/calendar/screens/cuidado_proximo_screen.dart'; // Ajusta la ruta según tu estructura

class CalendarScreen extends StatelessWidget {
  static const String name = 'calendar_screen';
  static const String route = '/calendar';

  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Desactiva el botón de "atrás"
        title: Image.asset(
          'assets/logo_or_15.png', // Reemplaza con tu logo
          height: 40,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Acción para las notificaciones
            },
          ),
        ],
      ),
      body: _CalendarView(), // Cuerpo principal con el calendario
      bottomNavigationBar: _BottomNavBar(), // Barra de navegación inferior
    );
  }
}

class _CalendarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          // Filtros de botones
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _FilterButton(text: "Actual", selected: false),
              _FilterButton(text: "Próximo", selected: true),
              _FilterButton(text: "Pendiente", selected: false),
            ],
          ),
          const SizedBox(height: 10),
          // Calendario
          Container(
            padding: const EdgeInsets.all(16),
            child: _CalendarWidget(),
          ),
          // Tarjeta de evento
          EventCard(
            title: "Cuidado Emilio",
            dateRange: "4 - 6 de Febrero",
            avatar: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
              child: Icon(Icons.image, color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CuidadoProximoScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime(2020),
      lastDay: DateTime(2030),
      focusedDay: DateTime.now(),
      calendarFormat: CalendarFormat.month,
      selectedDayPredicate: (day) {
        // Marca los días específicos
        return (day.day == 4 && day.month == 2) ||
            (day.day == 5 && day.month == 2) ||
            (day.day == 6 && day.month == 2);
      },
      calendarStyle: CalendarStyle(
        selectedDecoration: const BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
      ),
      onDaySelected: (selectedDay, focusedDay) {
        // Acción al seleccionar un día (opcional)
      },
    );
  }
}

class _FilterButton extends StatelessWidget {
  final String text;
  final bool selected;

  const _FilterButton({required this.text, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: () {
          // Acción para el botón de filtro (aún no definida)
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: selected ? Colors.blue : Colors.grey[300],
          foregroundColor: selected ? Colors.white : Colors.black,
        ),
        child: Text(text),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
      ],
      currentIndex: 1, // Establece el índice actual en CalendarScreen
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/home');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/calendar');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/chat');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/profile');
            break;
        }
      },
    );
  }
}
