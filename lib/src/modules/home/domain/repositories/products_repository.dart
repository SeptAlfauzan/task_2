import 'package:task_2/src/modules/home/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProducts();
}
