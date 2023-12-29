import 'dart:convert';

import 'package:eat_sneakers/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<List<ProductModel>> getProducts() async {
    var url = Uri.parse('$baseUrl/products');

    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];

      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      print(products);

      return products;
    } else {
      throw Exception('Gagal Get Products');
    }
  }

  // Future<List<ProductModel>> getProducts() async {
  //   var url = Uri.parse('$baseUrl/products');

  //   var headers = {'Content-Type': 'application/json'};

  //   var response = await http.get(url, headers: headers);

  //   print(response.body);

  //   if (response.statusCode == 200) {
  //     List data = jsonDecode(response.body)['data']['data'];

  //     List<ProductModel> products = [];

  //     for (var item in data) {
  //       products.add(ProductModel.fromJson(item));
  //       print('kita cek yang masuk products: ${item}');
  //     }

  //     return products;
  //   } else {
  //     throw Exception('Gagal Get Products');
  //   }
  // }
}
