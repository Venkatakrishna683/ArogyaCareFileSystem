import 'package:flutter/material.dart';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medicine Reminders')),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (c, i) => Card(margin: const EdgeInsets.all(12), child: ListTile(leading: const Icon(Icons.alarm, color: Colors.orange), title: Text('Paracetamol - ${8 + i}:00 AM'), subtitle: const Text('1 tablet - After food'), trailing: Row(mainAxisSize: MainAxisSize.min, children: [TextButton(onPressed: () {}, child: const Text('Taken')), TextButton(onPressed: () {}, child: const Text('Missed', style: TextStyle(color: Colors.red)))]))),
      ),
    );
  }
}