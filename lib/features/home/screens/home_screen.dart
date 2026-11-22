import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/home_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArogyaFile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_balance_wallet),
            onPressed: () => context.push('/wallet'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // SOS Box - Expanded lekunda
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE8E8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                children: [
                  Icon(Icons.emergency, color: AppColors.red, size: 36),
                  SizedBox(width: 12),
                  Text(
                    'Emergency SOS',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            HomeCard(
              title: 'Upload Prescription',
              subtitle: 'Photo teesi save cheyyandi',
              icon: Icons.camera_alt,
              color: AppColors.teal,
              onTap: () => context.push('/upload'),
            ),
            HomeCard(
              title: 'My Prescriptions',
              subtitle: 'Anni prescriptions chudandi',
              icon: Icons.folder,
              color: AppColors.navy,
              onTap: () => context.push('/prescriptions'),
            ),
            HomeCard(
              title: 'My Medicines / Reminders',
              subtitle: 'Time ki mandu gurthu',
              icon: Icons.alarm,
              color: AppColors.orange,
              onTap: () => context.push('/reminders'),
            ),
            HomeCard(
              title: 'Find Pharmacy',
              subtitle: 'Daggarlo pharmacy + price',
              icon: Icons.local_pharmacy,
              color: AppColors.green,
              onTap: () => context.push('/find-pharmacy'),
            ),
            HomeCard(
              title: 'Family Vault',
              subtitle: 'Amma / Nanna prescriptions',
              icon: Icons.family_restroom,
              color: Colors.purple,
              onTap: () => context.push('/family'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Wallet lo Rs.6 undhi - Upload cheste Rs.2 vasthundi',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}