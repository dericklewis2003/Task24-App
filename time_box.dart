import 'package:flutter/material.dart';

class TimeBoxPage extends StatefulWidget {
  const TimeBoxPage({Key? key}) : super(key: key);

  @override
  _TimeBoxPageState createState() => _TimeBoxPageState();
}

class _TimeBoxPageState extends State<TimeBoxPage> {
  final List<bool> _selectedBlocks =
      List.generate(24, (index) => false); // 24 hours time slots

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Box'),
        backgroundColor: Colors.teal[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Select Time Blocks:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Time Grid Layout
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 4 blocks per row (to represent hours)
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2,
                ),
                itemCount: 24, // 24 blocks for 24 hours
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedBlocks[index] =
                            !_selectedBlocks[index]; // Toggle block
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: _selectedBlocks[index]
                            ? Colors.teal[300] // Selected block color
                            : Colors.grey[300], // Unselected block color
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}:00',
                          style: TextStyle(
                            color: _selectedBlocks[index]
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Save Button
            ElevatedButton(
              onPressed: () {
                // Handle saving the time box slots logic here
              },
              child: const Text('Save Time Box'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[600], // Update to backgroundColor
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 15.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
