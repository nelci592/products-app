import 'package:products_app/src/modules/products/data/model/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> getList();
}
