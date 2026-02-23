class Product {
  final String id;
  final String name;
  final double price;
  final String emoji;
  final String description;
  final String category;
  final String? imagePath;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.emoji,
    required this.description,
    this.category = 'Lainnya',
    this.imagePath,
  });
}
