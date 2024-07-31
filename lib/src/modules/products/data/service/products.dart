import "dart:async";
import 'package:chopper/chopper.dart';
import 'package:products_app/src/modules/products/data/model/product.dart';

part "products.chopper.dart";

@ChopperApi()
abstract class ProductsService extends ChopperService {
  @Get(path: "/products")
  Future<Response<List<Product>>> getList();

  static ProductsService create([ChopperClient? client]) =>
      _$ProductsService(client);
}
