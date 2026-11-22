class FamilyMemberModel {
  final String id;
  final String ownerId;
  final String name;
  final String relation;
  final int age;

  FamilyMemberModel({required this.id, required this.ownerId, required this.name, required this.relation, required this.age});

  factory FamilyMemberModel.fromJson(Map<String, dynamic> json) {
    return FamilyMemberModel(
      id: json['id'] ?? '',
      ownerId: json['owner_id'] ?? '',
      name: json['name'] ?? '',
      relation: json['relation'] ?? '',
      age: json['age'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'owner_id': ownerId, 'name': name, 'relation': relation, 'age': age,
  };
}