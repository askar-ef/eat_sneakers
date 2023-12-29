import 'package:eat_sneakers/models/category_model.dart';
import 'package:eat_sneakers/models/gallery_model.dart';

class ProductModel {
  int id;
  String name;
  double price;
  String description;
  String tags;
  CategoryModel category;
  DateTime? createdAt;
  DateTime? upadatedAt;
  List<GalleryModel> galleries;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.tags,
    required this.category,
    this.createdAt,
    this.upadatedAt,
    required this.galleries,
  });

  factory ProductModel.toJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      tags: json['tags'],
      category: CategoryModel.fromJson(json['category']),
      galleries: (json['galleries'] as List<dynamic>)
          .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
          .toList(),
      createdAt: DateTime.parse(json['created_at']),
      upadatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': category.toJson(),
      'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
      'createdAt': createdAt.toString(),
      'updatedAt': upadatedAt.toString()
    };
  }
}
