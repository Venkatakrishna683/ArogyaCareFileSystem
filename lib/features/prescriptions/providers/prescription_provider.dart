import 'package:flutter/material.dart';
import '../../../data/models/prescription_model.dart';
import '../../../data/repositories/prescription_repository.dart';

class PrescriptionProvider extends ChangeNotifier {
  final _repo = PrescriptionRepository();
  List<PrescriptionModel> list = [];
  bool isLoading = false;

  Future<void> load(String userId) async {
    isLoading = true; notifyListeners();
    list = await _repo.getPrescriptions(userId);
    isLoading = false; notifyListeners();
  }
}