class ProductData {
  final int id;
  final String name;
  final String description;
  final int price;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductData({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method untuk parsing JSON ke objek ProductData
  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
