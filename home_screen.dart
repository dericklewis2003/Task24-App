import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'time_box.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedDay = DateTime.now();
  List<String> _events = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _selectedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay!, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _loadEventsForSelectedDay();
              });
            },
            firstDay: DateTime.now().subtract(const Duration(days: 365)),
            lastDay: DateTime.now().add(const Duration(days: 365)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _events.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_events[index]!),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TimeBoxPage()),
              );
            },
            child: const Text('Go to Time Box'),
          ),
        ],
      ),
    );
  }

  void _loadEventsForSelectedDay() {
    setState(() {
      _events = [];
    });
  }
}