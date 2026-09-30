
import 'package:ecommerce/features/home/domain/entity/product_entity.dart';

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;

  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
  });

  factory ProductModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return ProductModel(
      id: json['id'] as int,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      image: json['image'] as String,
      category: json['category'] as String,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: title,
      price: price,
      description: description,
      image: image,
      category: category,
    );
  }
}