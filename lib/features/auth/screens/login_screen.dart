import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/validators.dart';
import '../../../core/widgets/app_textfield.dart';
import '../../../core/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneCtrl = TextEditingController();
  String? _error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Mobile Number Enter Cheyyandi', style: AppTextStyles.heading),
            const SizedBox(height: 8),
            const Text('OTP mee mobile ki vasthundi', style: AppTextStyles.small),
            const SizedBox(height: 24),
            AppTextField(hint: '10-digit Mobile Number', controller: _phoneCtrl, keyboardType: TextInputType.phone, maxLength: 10),
            if (_error != null) Padding(padding: const EdgeInsets.only(top: 8), child: Text(_error!, style: const TextStyle(color: Colors.red))),
            const SizedBox(height: 24),
            PrimaryButton(
              text: 'Send OTP',
              onPressed: () {
                if (!Validators.isValidPhone(_phoneCtrl.text)) {
                  setState(() => _error = 'Valid 10-digit number ivvandi');
                  return;
                }
                context.go('/otp', extra: _phoneCtrl.text);
              },
            ),
            const SizedBox(height: 16),
            const Center(child: Text('Demo OTP: 123456', style: TextStyle(color: Colors.grey))),
          ],
        ),
      ),
    );
  }
}