import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/config/supabase_config.dart';

class AuthRepository {
  bool get _isSupabaseConfigured {
    return !SupabaseConfig.url.contains('YOUR_PROJECT') &&
           SupabaseConfig.url.startsWith('https://');
  }

  Future<bool> verifyDemoOtp(String phone, String otp) async {
    if (otp != '123456') return false;

    // Supabase save ni background lo - wait cheyyaku
    if (_isSupabaseConfigured) {
      _saveInBackground(phone);
    }
    // Ventane true - loading aagadu
    return true;
  }

  void _saveInBackground(String phone) {
    Future(() async {
      try {
        final supabase = Supabase.instance.client;
        await supabase.from('profiles').upsert({
          'phone': phone,
          'name': 'Patient',
          'language': 'Telugu',
          'role': 'patient',
        }, onConflict: 'phone').timeout(const Duration(seconds: 3));
        print('Profile saved in Supabase');
      } catch (e) {
        print('Background save failed: $e');
      }
    });
  }

  Future<void> logout() async {
    if (_isSupabaseConfigured) {
      try { await Supabase.instance.client.auth.signOut(); } catch (_) {}
    }
  }
}