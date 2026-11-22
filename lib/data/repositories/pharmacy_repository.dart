import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/pharmacy_model.dart';

class PharmacyRepository {
  final _supabase = Supabase.instance.client;

  Future<List<PharmacyModel>> searchPharmacy(String medicineName) async {
    final res = await _supabase
        .from('pharmacy_stock')
        .select('*, pharmacies(*)')
        .ilike('medicine_name', '%$medicineName%')
        .eq('in_stock', true);
    // Simple mapping - demo kosam
    return (res as List).map((e) {
      final p = e['pharmacies'] ?? {};
      return PharmacyModel.fromJson({...p, 'price': e['price'], 'generic_price': e['generic_price']});
    }).toList();
  }
}