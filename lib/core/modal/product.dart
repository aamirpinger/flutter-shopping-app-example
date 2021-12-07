class Product {
  final int id;
  final String title;
  final String category;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      price: double.parse(json['price'].toString()),
      image: json['image'],
    );
  }
}
