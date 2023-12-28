import 'dart:convert';

import 'package:eat_sneakers/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<UserModel> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/register');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      print('Register Response: ${response.statusCode}');
      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        UserModel user = UserModel.fromJson(data['user']);
        user.token = 'Bearer ' + data['access_token'];

        return user;
      } else {
        throw http.ClientException(
          'Gagal Register. Status Code: ${response.statusCode}',
          url,
        );
      }
    } catch (e) {
      print('Gagal Register. Error: $e');
      throw http.ClientException('Gagal Register. Error: $e', url);
    }
  }
}
