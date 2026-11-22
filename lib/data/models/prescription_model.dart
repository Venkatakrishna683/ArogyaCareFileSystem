import 'medicine_model.dart';

class PrescriptionModel {
  final String id;
  final String userId;
  final String doctorName;
  final String hospitalName;
  final DateTime date;
  final String photoUrl;
  final String status; // active / completed
  final List<MedicineModel> medicines;

  PrescriptionModel({
    required this.id, required this.userId, required this.doctorName,
    required this.hospitalName, required this.date, required this.photoUrl,
    required this.status, this.medicines = const [],
  });

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) {
    return PrescriptionModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      doctorName: json['doctor_name'] ?? '',
      hospitalName: json['hospital_name'] ?? '',
      date: DateTime.tryParse(json['date'] ?? '') ?? DateTime.now(),
      photoUrl: json['photo_url'] ?? '',
      status: json['status'] ?? 'active',
    );
  }
}