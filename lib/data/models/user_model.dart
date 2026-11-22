class UserModel {
  final String id;
  final String phone;
  final String name;
  final String language;
  final String role;

  UserModel({required this.id, required this.phone, required this.name, required this.language, required this.role});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      phone: json['phone'] ?? '',
      name: json['name'] ?? '',
      language: json['language'] ?? 'Telugu',
      role: json['role'] ?? 'patient',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id, 'phone': phone, 'name': name, 'language': language, 'role': role,
  };
}