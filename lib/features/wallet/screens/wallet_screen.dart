import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Wallet')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Container(padding: const EdgeInsets.all(24), width: double.infinity, decoration: BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.circular(16)), child: const Column(children: [Text('Balance', style: TextStyle(color: Colors.white)), Text('₹ 6', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold))])),
          const SizedBox(height: 16),
          const ListTile(title: Text('Prescription Upload - Dr. Sharma'), trailing: Text('+ ₹2', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold))),
          const ListTile(title: Text('Prescription Upload - Dr. Rao'), trailing: Text('+ ₹2', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold))),
        ]),
      ),
    );
  }
}