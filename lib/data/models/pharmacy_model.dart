class PharmacyModel {
  final String id;
  final String name;
  final String phone;
  final String address;
  final double lat;
  final double lng;
  final double? price;
  final double? genericPrice;
  final bool inStock;

  PharmacyModel({
    required this.id, required this.name, required this.phone,
    required this.address, required this.lat, required this.lng,
    this.price, this.genericPrice, this.inStock = true,
  });

  factory PharmacyModel.fromJson(Map<String, dynamic> json) {
    return PharmacyModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      lat: (json['lat'] ?? 0).toDouble(),
      lng: (json['lng'] ?? 0).toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      genericPrice: (json['generic_price'] as num?)?.toDouble(),
      inStock: json['in_stock'] ?? true,
    );
  }
}