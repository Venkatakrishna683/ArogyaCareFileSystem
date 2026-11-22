import 'package:flutter/material.dart';
class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Analytics (No Name/Phone)')), body: const Center(child: Text('Total Prescriptions: 100\nCity-wise counts only')));
}