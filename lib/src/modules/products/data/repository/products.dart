import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:products_app/src/config/chopper.dart';
import 'package:products_app/src/modules/products/data/model/product.dart';
import 'package:products_app/src/modules/products/data/service/products.dart';
import 'package:products_app/src/modules/products/domain/repository/products.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsService _service;

  ProductsRepositoryImpl(this._service);

  @override
  Future<List<Product>> getList() {
    return _service.getList().then((response) {
      return response.body!;
    });
  }
}

final productsRepository = Provider<ProductsRepository>(
  (ref) => ProductsRepositoryImpl(
    ProductsService.create(
      ref.read(chopperProvider),
    ),
  ),
);
