import 'package:flutter/material.dart';

class DayView extends StatelessWidget {
  final DateTime selectedDay;
  final List<String> events;

  const DayView({super.key, required this.selectedDay, required this.events});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Events for ${selectedDay.toLocal().toString().split(' ')[0]}'),
        backgroundColor: Colors.teal[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Events for ${selectedDay.toLocal().toString().split(' ')[0]}:',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(events[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
