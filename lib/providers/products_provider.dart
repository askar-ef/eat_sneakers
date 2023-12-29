import 'package:eat_sneakers/models/product_model.dart';
import 'package:eat_sneakers/services/product_services.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();

    Future<void> getProducts() async {
      try {
        List<ProductModel> products = await ProductServices().getProducts();
        _products = products;
      } catch (e) {
        print(e);
      }
    }
  }

  void getProducts() {}
}
