import 'package:products_app/src/modules/products/data/model/product.dart';
import 'package:products_app/src/modules/products/domain/repository/products.dart';

class ProductsUseCase {
  final ProductsRepository _productsRepository;

  ProductsUseCase(this._productsRepository);

  Future<List<Product>> getProducts() {
    return _productsRepository.getList();
  }
}
