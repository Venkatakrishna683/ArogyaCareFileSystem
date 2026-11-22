import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/app_textfield.dart';
import '../../../core/widgets/primary_button.dart';
import '../providers/auth_provider.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  const OtpScreen({super.key, required this.phone});
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpCtrl = TextEditingController(text: '123456');
  String? _error;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Verify OTP')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('OTP pampincham\n+91 ${widget.phone}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            AppTextField(hint: '6-digit OTP', controller: _otpCtrl, keyboardType: TextInputType.number, maxLength: 6),
            if (_error != null) Text(_error!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 24),
            PrimaryButton(
              text: 'Verify & Login',
              isLoading: provider.isLoading,
              onPressed: () async {
                final ok = await provider.verifyOtp(widget.phone, _otpCtrl.text);
                if (ok && mounted) {
                  context.go('/home');
                } else {
                  setState(() => _error = 'Wrong OTP. Demo OTP: 123456');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}