import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/prescription_model.dart';

class PrescriptionRepository {
  final _supabase = Supabase.instance.client;

  // P0.4 Duplicate Check
  Future<bool> isDuplicate(String photoHash) async {
    final res = await _supabase
        .from('prescriptions')
        .select('id')
        .eq('photo_hash', photoHash)
        .maybeSingle();
    return res != null;
  }

  Future<List<PrescriptionModel>> getPrescriptions(String userId) async {
    final res = await _supabase
        .from('prescriptions')
        .select()
        .eq('user_id', userId)
        .order('date', ascending: false);
    return (res as List).map((e) => PrescriptionModel.fromJson(e)).toList();
  }

  Future<void> savePrescription({
    required String userId,
    required String doctorName,
    required String hospitalName,
    required String photoUrl,
    required String photoHash,
  }) async {
    // Duplicate aithe error
    if (await isDuplicate(photoHash)) {
      throw Exception('Ee prescription already upload chesav');
    }
    await _supabase.from('prescriptions').insert({
      'user_id': userId,
      'doctor_name': doctorName,
      'hospital_name': hospitalName,
      'photo_url': photoUrl,
      'photo_hash': photoHash,
      'date': DateTime.now().toIso8601String(),
      'status': 'active',
    });
  }
}