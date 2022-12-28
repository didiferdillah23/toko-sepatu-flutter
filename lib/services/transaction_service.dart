import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tokosepatu/models/cart_model.dart';

class TransactionService {
  String baseUrl = 'https://didi-ferdillah-factory.000webhostapp.com/api';

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    var url = '$baseUrl/checkout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode(
      {
        'address': 'Medan',
        'items': carts
            .map((e) => {
                  'id': e.product!.id,
                  'quantity': e.qty,
                })
            .toList(),
        'status': 'PENDING',
        'total_price': totalPrice,
        'shipping_price': 0,
      },
    );

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Melakukan Checkout!');
    }
  }
}
