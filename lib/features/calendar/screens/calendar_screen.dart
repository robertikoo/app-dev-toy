import 'package:flutter/material.dart';
import '../widgets/event_cart.dart'; // Asegúrate de tener la importación correcta
import 'package:table_calendar/table_calendar.dart';
class CalendarScreen extends StatelessWidget {
  static const String name = 'calendar_screen';
  static const String route = '/calendar';

  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Eliminar el ícono de retroceso
        title: Image.asset(
          'assets/logo_or_15.png', // Ruta del logo
          height: 40, // Ajusta el tamaño según sea necesario
        ),
        centerTitle: true, // Centrar el logo
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Acción para notificaciones
            },
          ),
        ],
      ),
      body: const _CalendarView(),
      bottomNavigationBar: _BottomNavBar(),
    );
  }
}



class _CalendarView extends StatelessWidget {
  const _CalendarView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Esto hace que el contenido sea desplazable
      child: Column(
        children: [
          const SizedBox(height: 10),
          // Filtros de calendario
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
          Container( // Eliminamos 'Expanded' y ponemos un contenedor con un tamaño fijo
            padding: const EdgeInsets.all(16),
            child: _CalendarWidget(),
          ),

          // Tarjeta de evento con avatar
          const EventCard(
            title: "Cuidado Emilio",
            dateRange: "4 - 6 de Febrero",
            avatar: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
              child: const Icon(Icons.image, color: Colors.white),
            ),
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
        return (day.day == 4 && day.month == 2) ||
               (day.day == 5 && day.month == 2) ||
               (day.day == 6 && day.month == 2);
      },
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
      ),
      onDaySelected: (selectedDay, focusedDay) {
        // Acción cuando se selecciona una fecha
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
          // Acción del filtro
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
      currentIndex: 1, // Índice del calendario
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
