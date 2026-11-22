class Validators {
  static bool isValidPhone(String phone) {
    return RegExp(r'^[6-9]\d{9}$').hasMatch(phone);
  }

  static bool isValidOtp(String otp) {
    return otp.length == 6;
  }
}