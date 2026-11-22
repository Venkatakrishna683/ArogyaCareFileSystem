import 'package:flutter/material.dart';
import '../../../data/models/family_member_model.dart';

class FamilyProvider extends ChangeNotifier {
  List<FamilyMemberModel> members = [
    FamilyMemberModel(id: '1', ownerId: 'me', name: 'Amma', relation: 'Mother', age: 52),
    FamilyMemberModel(id: '2', ownerId: 'me', name: 'Nanna', relation: 'Father', age: 58),
  ];
}