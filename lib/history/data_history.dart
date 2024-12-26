class DataHistory {
  final int id;
  final int productId;
  final String snapToken;
  final String status;
  final int totalPrice;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  DataHistory({
    required this.id,
    required this.productId,
    required this.snapToken,
    required this.status,
    required this.totalPrice,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DataHistory.fromJson(Map<String, dynamic> json) {
    return DataHistory(
      id: json['id'],
      productId: json['product_id'],
      snapToken: json['snap_token'],
      status: json['status'],
      totalPrice: json['total_price'],
      userId: json['user_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
