import 'package:eat_sneakers/models/product_model.dart';
import 'package:eat_sneakers/services/product_services.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  // Setter yang benar
  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  // Metode getProducts yang benar
  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductServices().getProducts();
      _products = products;
      notifyListeners();
      print('Products: $_products');
    } catch (e) {
      print(e);
    }
  }
}
