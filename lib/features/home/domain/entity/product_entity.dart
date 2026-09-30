class ProductEntity {
  final int id;
  final String name;
  final String image;
  final String category;
  final double price;
  final String description;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
  });
}
