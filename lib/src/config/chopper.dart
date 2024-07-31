import 'package:chopper/chopper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:products_app/src/modules/products/data/model/product.dart';
import 'package:products_app/src/utils/json_serializable_converter.dart';

final chopperProvider = Provider<ChopperClient>(
  (ref) => ChopperClient(
    baseUrl: Uri.parse("https://dummyjson.com"),
    converter: const JsonSerializableConverter({
      Product: Product.fromJson,
    }),
  ),
);
