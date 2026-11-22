import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PrescriptionListScreen extends StatelessWidget {
  const PrescriptionListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Prescriptions')),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (c, i) => Card(
          margin: const EdgeInsets.all(12),
          child: ListTile(
            leading: const Icon(Icons.description, color: Colors.teal, size: 36),
            title: Text('Dr. Sharma - Hospital ${i + 1}'),
            subtitle: Text('Date: 2${i + 1} Nov 2026 • Active'),
            trailing: const Chip(label: Text('Active'), backgroundColor: Colors.greenAccent),
            onTap: () => context.push('/prescription-detail'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => context.push('/upload'), child: const Icon(Icons.add)),
    );
  }
}