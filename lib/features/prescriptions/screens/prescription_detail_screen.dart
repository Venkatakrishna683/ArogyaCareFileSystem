import 'package:flutter/material.dart';
class PrescriptionDetailScreen extends StatelessWidget {
  const PrescriptionDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prescription Detail')),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Dr. Sharma', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text('Apollo Hospital, Bangalore'),
          SizedBox(height: 20),
          Text('Medicines:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ListTile(title: Text('Paracetamol 650'), subtitle: Text('1-1-1 • 3 days')),
          ListTile(title: Text('Azithromycin 500'), subtitle: Text('1-0-0 • 5 days')),
        ]),
      ),
    );
  }
}