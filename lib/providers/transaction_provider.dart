import 'package:eat_sneakers/models/cart_model.dart';
import 'package:eat_sneakers/services/transaction_services.dart';
import 'package:flutter/material.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    try {
      if (await TransactionServices().checkout(token, carts, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
