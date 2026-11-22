class MedicineModel {
  final String id;
  final String prescriptionId;
  final String name;
  final String dose;
  final String frequency;
  final int durationDays;
  final bool morning;
  final bool afternoon;
  final bool night;

  MedicineModel({
    required this.id, required this.prescriptionId, required this.name,
    required this.dose, required this.frequency, required this.durationDays,
    this.morning = true, this.afternoon = false, this.night = false,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      id: json['id'] ?? '',
      prescriptionId: json['prescription_id'] ?? '',
      name: json['name'] ?? '',
      dose: json['dose'] ?? '',
      frequency: json['frequency'] ?? '',
      durationDays: json['duration_days'] ?? 0,
      morning: json['morning'] ?? true,
      afternoon: json['afternoon'] ?? false,
      night: json['night'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'prescription_id': prescriptionId, 'name': name, 'dose': dose,
    'frequency': frequency, 'duration_days': durationDays,
    'morning': morning, 'afternoon': afternoon, 'night': night,
  };
}