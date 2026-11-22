import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/config/app_constants.dart';

class WalletRepository {
  final _supabase = Supabase.instance.client;

  Future<double> getBalance(String userId) async {
    final res = await _supabase.from('wallet').select('balance').eq('user_id', userId).maybeSingle();
    return (res?['balance'] ?? 0).toDouble();
  }

  Future<void> addReward(String userId) async {
    final current = await getBalance(userId);
    await _supabase.from('wallet').upsert({
      'user_id': userId,
      'balance': current + AppConstants.walletRewardPerUpload,
    }, onConflict: 'user_id');
  }
}