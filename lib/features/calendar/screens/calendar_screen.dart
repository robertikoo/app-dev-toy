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
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              _FilterButton(text: "Actual", selected: false),
              _FilterButton(text: "Próximo", selected: true),
              _FilterButton(text: "Pendiente", selected: false),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            child: _CalendarWidget(),
          ),
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
          color: Color.fromRGBO(0, 0, 255, 0.5),
          shape: BoxShape.circle,
        ),
      ),
      onDaySelected: (selectedDay, focusedDay) {},
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
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: selected ? Colors.blue : Colors.grey[300],
          foregroundColor: selected ? Colors.white : Colors.black,
        ),
        child: Text(text),
      ),
    );
  }
}
