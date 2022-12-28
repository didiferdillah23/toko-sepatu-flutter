import 'dart:convert';

import 'package:tokosepatu/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  String baseUrl =
      'https://didi-ferdillah-factory.000webhostapp.com/api/products';

  Future<List<ProductModel>> allProducts() async {
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(Uri.parse(baseUrl), headers: headers);

    // print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal mengambil data produk');
    }
  }
}
