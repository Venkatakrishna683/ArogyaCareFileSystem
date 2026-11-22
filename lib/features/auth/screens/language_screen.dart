import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/primary_button.dart';
import '../providers/auth_provider.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();
    final langs = ['Telugu', 'English', 'Hindi', 'Kannada'];
    final icons = ['త', 'A', 'ह', 'ಕ'];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text('ArogyaFile', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.teal)),
              const Text('Mee Arogyam, Mee Chethilo', style: AppTextStyles.body),
              const SizedBox(height: 30),
              const Text('Mee Bhasha Enchukondi / Select Language', style: AppTextStyles.subHeading),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
                  itemCount: langs.length,
                  itemBuilder: (c, i) {
                    final selected = provider.selectedLanguage == langs[i];
                    return GestureDetector(
                      onTap: () => provider.setLanguage(langs[i]),
                      child: Container(
                        decoration: BoxDecoration(
                          color: selected ? AppColors.teal : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: selected ? AppColors.teal : Colors.grey.shade300, width: 2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(icons[i], style: TextStyle(fontSize: 40, color: selected ? Colors.white : AppColors.navy, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Text(langs[i], style: TextStyle(fontSize: 18, color: selected ? Colors.white : AppColors.navy, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              PrimaryButton(text: 'Continue  →', onPressed: () => context.go('/login')),
            ],
          ),
        ),
      ),
    );
  }
}