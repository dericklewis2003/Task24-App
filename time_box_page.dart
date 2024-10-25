import 'package:flutter/material.dart';

class TimeBoxPage extends StatefulWidget {
  const TimeBoxPage({Key? key}) : super(key: key);

  @override
  _TimeBoxPageState createState() => _TimeBoxPageState();
}

class _TimeBoxPageState extends State<TimeBoxPage> {
  final List<bool> _selectedBlocks =
      List.generate(24, (index) => false); // 24 hours time slots
  final TextEditingController _topPrioritiesController =
      TextEditingController();
  final TextEditingController _brainDumpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Time Box'),
        backgroundColor: Colors.teal[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 3, // 3/5 width for left section
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Top Priorities',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: _topPrioritiesController,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your top priorities',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Brain Dump',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: _brainDumpController,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Write your thoughts...',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 2, // 2/5 width for right section
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Date: ____________',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 24,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${(index + 5) % 12 + 1} : 00'), // 5 AM to 12 PM
                            Text(
                                '${(index + 5) % 12 + 1} : 30'), // 5:30 AM to 12:30 PM
                            Checkbox(
                              value: _selectedBlocks[index],
                              onChanged: (value) {
                                setState(() {
                                  _selectedBlocks[index] = value!;
                                });
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
