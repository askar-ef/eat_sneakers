// askar
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/cart_model.dart';

class TransactionServices {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    var url = Uri.parse('$baseUrl/checkout');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var body = jsonEncode({
      'address': 'Marsmoon',
      'items': carts
          .map((cart) => {
                'id': cart.product.id,
                'quantity': cart.quantity,
              })
          .toList(),
      'total_price': totalPrice,
      'shipping_price': 0,
      'status': 'PENDING',
    });
    var response = await http.post(url, headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Checkout');
    }
  }
}
