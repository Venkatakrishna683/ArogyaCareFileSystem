import 'package:flutter/material.dart';
import '../../../data/repositories/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  final _repo = AuthRepository();
  bool isLoading = false;
  String selectedLanguage = 'Telugu';
  String? phone;

  void setLanguage(String lang) {
    selectedLanguage = lang;
    notifyListeners();
  }

  Future<bool> verifyOtp(String phoneNumber, String otp) async {
    isLoading = true;
    notifyListeners();
    final ok = await _repo.verifyDemoOtp(phoneNumber, otp);
    isLoading = false;
    notifyListeners();
    if (ok) phone = phoneNumber;
    return ok;
  }
}