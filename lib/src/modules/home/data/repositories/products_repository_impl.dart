import 'dart:convert';

import 'package:task_2/src/modules/home/domain/entities/product.dart';
import 'package:task_2/src/modules/home/domain/repositories/products_repository.dart';
import 'package:http/http.dart' as http;
import 'package:task_2/src/utils/constanta.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  @override
  Future<List<Product>> getProducts() async {
    final url = Uri.parse('$baseUrl/products?offset=0&limit=10');
    final response = await http.get(url);
    final List<dynamic> jsonData = json.decode(response.body);
    final products = jsonData.map((item) => Product.fromJson(item)).toList();
    return products;
  }
}
