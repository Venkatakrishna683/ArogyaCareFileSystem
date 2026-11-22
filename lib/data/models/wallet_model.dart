class WalletModel {
  final String userId;
  final double balance;

  WalletModel({required this.userId, required this.balance});

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      userId: json['user_id'] ?? '',
      balance: (json['balance'] ?? 0).toDouble(),
    );
  }
}