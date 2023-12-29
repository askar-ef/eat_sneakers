import 'package:eat_sneakers/models/product_model.dart';
import 'package:flutter/material.dart';

class WishlistProvider with ChangeNotifier {
  List<ProductModel> _wishlist = [];
  List<ProductModel> get wishlist => _wishlist;

  set wishlist(List<ProductModel> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  setProduct(ProductModel product) {
    if (!isWishlist(product)) {
      _wishlist.add(product);
    } else {
      _wishlist.removeWhere((element) => element.id == product.id);
    }

    notifyListeners();
  }

  bool isWishlist(ProductModel product) {
    return _wishlist.indexWhere((element) => element.id == product.id) != -1;
  }
}
