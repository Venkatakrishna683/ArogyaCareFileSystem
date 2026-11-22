import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../data/services/storage_service.dart';

class UploadProvider extends ChangeNotifier {
  Uint8List? imageBytes; // Web + Mobile rendu ki idi pani chesthadhi
  String ocrText = '';
  bool isLoading = false;
  String fileName = '';

  Future<void> pickImage(ImageSource source) async {
    final picked = await ImagePicker().pickImage(source: source, imageQuality: 80);
    if (picked != null) {
      imageBytes = await picked.readAsBytes();
      fileName = picked.name;
      isLoading = true;
      notifyListeners();

      // Web lo ML Kit pani cheyyadhu, anduke manual ga pettam
      if (kIsWeb) {
        ocrText = 'Web lo OCR pani cheyyadhu.\nPhoto vachindhi: $fileName\n\nKindha manual ga Doctor peru rayandi.';
      } else {
        ocrText = 'OCR Reading... Phone lo matrame pani chesthadhi';
      }
      isLoading = false;
      notifyListeners();
    }
  }

  // FIXED: bool ki badulu String? - success aythe null, fail aythe error message
  Future<String?> saveToSupabase() async {
    if (imageBytes == null) return 'Photo ledu - mundu photo select cheyyandi';
    try {
      isLoading = true;
      notifyListeners();

      // File name empty unte default peru pettu - lekapothe Storage fail avthadhi
      final safeFileName = fileName.isEmpty
          ? 'prescription_${DateTime.now().millisecondsSinceEpoch}.jpg'
          : fileName;

      // Step 1 - Photo ni Storage lo petti link teesko
      final photoUrl = await StorageService().uploadBytes(imageBytes!, safeFileName);
      print('Photo uploaded: $photoUrl');

      // Step 2 - Details ni prescriptions table lo save cheyyi
      final supabase = Supabase.instance.client;
      await supabase.from('prescriptions').insert({
        'user_id': 'demo-user',
        'doctor_name': 'Dr. Test',
        'hospital_name': 'Demo Hospital',
        'photo_url': photoUrl,
        'photo_hash': DateTime.now().millisecondsSinceEpoch.toString(),
        'date': DateTime.now().toIso8601String(),
        'status': 'active',
      });

      // Step 3 - Wallet lo Rs.2 add cheyyi
      final walletRes = await supabase
          .from('wallet')
          .select('balance')
          .eq('user_id', 'demo-user')
          .maybeSingle();

      final current = (walletRes?['balance'] ?? 0) as num;
      await supabase.from('wallet').upsert({
        'user_id': 'demo-user',
        'balance': current.toDouble() + 2,
      }, onConflict: 'user_id');

      isLoading = false;
      notifyListeners();
      return null; // Success
    } catch (e) {
      print('Save failed: $e');
      isLoading = false;
      notifyListeners();
      return e.toString(); // Error ni bayataki pamputhunnam
    }
  }
}