import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDropdown extends StatefulWidget {
  final Set<DateTime>? selectedDates;
  final Function(Set<DateTime>) onDatesSelected;
  final List<DateTime> markedDates;
  final String selectedCuando;

  const CalendarDropdown({
    super.key,
    this.selectedDates,
    required this.onDatesSelected,
    required this.markedDates,
    required this.selectedCuando,
  });

  @override
  State<CalendarDropdown> createState() => _CalendarDropdownState();
}

class _CalendarDropdownState extends State<CalendarDropdown> {
  bool isCuandoExpanded = false;
  late DateTime _focusedDay;
  late Set<DateTime> _selectedDates;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDates = widget.selectedDates?.toSet() ?? {};
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main button
        GestureDetector(
          onTap: () => setState(() => isCuandoExpanded = !isCuandoExpanded),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.black54),
                    const SizedBox(width: 8),
                    const Text("Cuándo", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Text(widget.selectedCuando, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
        // Expanded content
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: isCuandoExpanded ? 500 : 0,
          curve: Curves.easeInOut,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: '¿',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Cuándo',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        TextSpan(
                          text: ' deseas tu cuidado?',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  TableCalendar(
                    calendarFormat: CalendarFormat.month,
                    focusedDay: _focusedDay,
                    firstDay: DateTime.now(),
                    lastDay: DateTime(2025, 12, 31),
                    selectedDayPredicate: (day) {
                      return _selectedDates.contains(DateTime(
                        day.year,
                        day.month,
                        day.day,
                      ));
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _focusedDay = focusedDay;
                        final normalizedDay = DateTime(
                          selectedDay.year,
                          selectedDay.month,
                          selectedDay.day,
                        );
                        
                        if (_selectedDates.contains(normalizedDay)) {
                          _selectedDates.remove(normalizedDay);
                        } else {
                          _selectedDates.add(normalizedDay);
                        }
                      });
                      widget.onDatesSelected(_selectedDates);
                    },
                    locale: 'es_ES',
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      leftChevronIcon: const Text('‹', style: TextStyle(fontSize: 24)),
                      rightChevronIcon: const Text('›', style: TextStyle(fontSize: 24)),
                    ),
                    daysOfWeekStyle: const DaysOfWeekStyle(
                      weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
                      weekendStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    calendarStyle: CalendarStyle(
                      outsideDaysVisible: false,
                      weekendTextStyle: const TextStyle(color: Colors.black),
                      defaultTextStyle: const TextStyle(color: Colors.black),
                      selectedDecoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  Text(
                    'Días seleccionados: ${_selectedDates.length}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => setState(() => isCuandoExpanded = false),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Siguiente",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
} 