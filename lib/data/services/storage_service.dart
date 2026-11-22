import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/config/app_constants.dart';

class StorageService {
  final _supabase = Supabase.instance.client;
  Future<String> uploadBytes(Uint8List bytes, String fileName) async {
    final path = '${DateTime.now().millisecondsSinceEpoch}_$fileName';
    await _supabase.storage
        .from(AppConstants.prescriptionsBucket)
        .uploadBinary(path, bytes);
    return _supabase.storage
        .from(AppConstants.prescriptionsBucket)
        .getPublicUrl(path);
  }
}