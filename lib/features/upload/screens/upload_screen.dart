import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/primary_button.dart';
import '../providers/upload_provider.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UploadProvider(),
      child: const _UploadView(),
    );
  }
}

class _UploadView extends StatelessWidget {
  const _UploadView();
  @override
  Widget build(BuildContext context) {
    final p = context.watch<UploadProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Prescription')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => p.pickImage(ImageSource.camera),
              child: Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                // Image.file ki badulu Image.memory - Web lo kuda pani chesthadhi
                child: p.imageBytes != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.memory(p.imageBytes!, fit: BoxFit.cover),
                      )
                    : const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt, size: 60, color: Colors.teal),
                          SizedBox(height: 12),
                          Text('Photo Upload Cheyyandi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('Prescription / Certificate emaina pettocchu'),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(child: OutlinedButton.icon(onPressed: () => p.pickImage(ImageSource.camera), icon: const Icon(Icons.camera), label: const Text('Camera'))),
              const SizedBox(width: 12),
              Expanded(child: OutlinedButton.icon(onPressed: () => p.pickImage(ImageSource.gallery), icon: const Icon(Icons.photo), label: const Text('Gallery'))),
            ]),
            const SizedBox(height: 16),
            if (p.isLoading) const CircularProgressIndicator(),
            if (p.ocrText.isNotEmpty)
              Expanded(child: SingleChildScrollView(child: Text(p.ocrText))),
            const SizedBox(height: 12),
            // FIXED - Provider tho match ayyela marchanu
            PrimaryButton(
              text: 'Save Prescription',
              isLoading: p.isLoading,
              onPressed: () async {
                if (p.imageBytes == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Mundu photo select cheyyandi')),
                  );
                  return;
                }
                // FIXED: mundhu `final ok = bool` undedhi, ippudu `String? error`
                final error = await p.saveToSupabase();
                if (error == null && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Nijanga Saved! Wallet lo Rs.2 vachayi')),
                  );
                  context.pop();
                } else if (context.mounted) {
                  // Ippudu asalu error enti kanipisthadhi, "Save avvaledu" ani blind ga raadu
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error: $error'),
                      duration: const Duration(seconds: 8),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}