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
  DateTime? updatedAt;
  List<GalleryModel> galleries;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.tags,
    required this.category,
    this.createdAt,
    this.updatedAt,
    required this.galleries,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      tags: json['tags'],
      category: CategoryModel.fromJson(json['category']),
      galleries: (json['galleries'] as List<dynamic>)
          .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
          .toList(),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
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
      'updatedAt': updatedAt.toString()
    };
  }
}

// class UninitializedProductModel extends ProductModel {}

class UninitializedProductModel extends ProductModel {
  UninitializedProductModel()
      : super(
          id: 0,
          name: '',
          price: 0.0,
          description: '',
          tags: '',
          category: CategoryModel(id: 0, name: ''),
          galleries: [],
        );
}



  // factory ProductModel.fromJson(Map<String, dynamic> json) {
  //   return ProductModel(
  //     id: json['id'],
  //     name: json['name'],
  //     price: json['price'].toDouble(),
  //     description: json['description'],
  //     tags: json['tags'],
  //     category: CategoryModel.fromJson(json['category']),
  //     galleries: (json['galleries'] as List<dynamic>)
  //         .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
  //         .toList(),
  //     createdAt: DateTime.parse(json['created_at']),
  //     updatedAt: DateTime.parse(json['updated_at']),
  //   );
  // }

  // factory ProductModel.fromJson(Map<String, dynamic> json) {
  //   return ProductModel(
  //     id: json['id'],
  //     name: json['name'],
  //     price: (json['price'] as num).toDouble(), // Konversi ke double
  //     description: json['description'],
  //     tags: json['tags'],
  //     category: CategoryModel.fromJson(json['category']),
  //     galleries: (json['galleries'] as List<dynamic>)
  //         .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
  //         .toList(),
  //     createdAt: DateTime.parse(json['created_at']),
  //     updatedAt: json['updated_at'] != null
  //         ? DateTime.parse(json['updated_at'])
  //         : null,
  //   );
  // }