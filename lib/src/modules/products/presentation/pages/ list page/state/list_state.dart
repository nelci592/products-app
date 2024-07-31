import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:products_app/src/modules/products/data/model/product.dart';
import 'package:products_app/src/modules/products/data/repository/products.dart';
import 'package:products_app/src/modules/products/domain/use_case/products_use_case.dart';

class ListState extends AutoDisposeAsyncNotifier<List<Product>?> {
  late ProductsUseCase _productsUseCase;

  @override
  FutureOr<List<Product>?> build() async {
    _productsUseCase = ProductsUseCase(ref.read(productsRepository));
    final initialList = await _productsUseCase.getProducts();

    if (initialList.isEmpty) {
      return null;
    } else {
      return initialList;
    }
  }
}

final listProvider =
    AutoDisposeAsyncNotifierProvider<ListState, List<Product>?>(ListState.new);
