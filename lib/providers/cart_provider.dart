import 'package:eat_sneakers/models/cart_model.dart';
import 'package:eat_sneakers/models/product_model.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];
  List<CartModel> get carts => carts;

  set carts(List<CartModel> carts) {
    notifyListeners();
  }

  addCarts(ProductModel product) {
    if (productExist(product)) {
      int index =
          _carts.indexWhere((element) => element.product.id == product.id);
      {
        _carts[index].quantity++;
      }
    } else {
      _carts.add(
        CartModel(id: _carts.length, product: product, quantity: 1),
      );
    }
    ;
    notifyListeners();
  }

  removeCart(int id) {
    _carts.remove(id);
    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].quantity++;
    notifyListeners();
  }

  reduceQuantitiy(int id) {
    _carts[id].quantity--;
    if (_carts[id].quantity == 0) {
      removeCart(id);
    }
    notifyListeners();
  }

  productExist(ProductModel product) {
    if (_carts.indexWhere((element) => element.product.id == product.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }

  totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.quantity;
    }
    return total;
  }

  totalPrice() {
    double total = 0;
    for (var item in _carts) {
      total += (item.quantity * item.product.price);
    }
    return total;
  }
}
