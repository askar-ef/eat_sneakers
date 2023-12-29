import 'package:eat_sneakers/models/cart_model.dart';
import 'package:eat_sneakers/models/product_model.dart';
import 'package:flutter/material.dart';

// class CartProvider with ChangeNotifier {
//   List<CartModel> _carts = [];
//   List<CartModel> get carts => _carts;

//   set carts(List<CartModel> carts) {
//     _carts = carts;
//     notifyListeners();
//   }

//   void addCarts(ProductModel product) {
//     if (productExist(product)) {
//       int index =
//           _carts.indexWhere((element) => element.product.id == product.id);
//       _carts[index].quantity++;
//     } else {
//       _carts.add(
//         CartModel(id: _carts.length, product: product, quantity: 1),
//       );
//     }
//     notifyListeners();
//   }

//   void removeCart(int id) {
//     _carts.removeWhere((element) => element.id == id);
//     notifyListeners();
//   }

//   void addQuantity(int id) {
//     _carts[id].quantity++;
//     notifyListeners();
//   }

//   void reduceQuantitiy(int id) {
//     _carts[id].quantity--;
//     if (_carts[id].quantity == 0) {
//       removeCart(id);
//     }
//     notifyListeners();
//   }

//   bool productExist(ProductModel product) {
//     return _carts.any((element) => element.product.id == product.id);
//   }

//   int totalItems() {
//     return _carts.fold(0, (total, item) => total + item.quantity);
//   }

//   double totalPrice() {
//     return _carts.fold(0.0, (total, item) => total + item.getTotalPrice());
//   }
// }

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];
  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
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
    notifyListeners();
  }

  removeCart(int id) {
    _carts.removeWhere((element) => element.id == id);
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
