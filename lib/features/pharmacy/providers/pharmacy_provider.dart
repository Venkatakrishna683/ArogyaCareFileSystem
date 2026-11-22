import 'package:flutter/material.dart';
import '../../../data/models/pharmacy_model.dart';
import '../../../data/repositories/pharmacy_repository.dart';

class PharmacyProvider extends ChangeNotifier {
  final _repo = PharmacyRepository();
  List<PharmacyModel> results = [];
  bool isLoading = false;

  Future<void> search(String name) async {
    isLoading = true; notifyListeners();
    try { results = await _repo.searchPharmacy(name); } catch (_) { results = []; }
    isLoading = false; notifyListeners();
  }
}