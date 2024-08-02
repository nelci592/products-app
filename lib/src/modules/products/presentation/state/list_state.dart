import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:products_app/src/modules/products/data/model/product.dart';
import 'package:products_app/src/modules/products/data/repository/products.dart';
import 'package:products_app/src/modules/products/domain/use_case/products_use_case.dart';

class ListState extends AutoDisposeAsyncNotifier<List<Product>?> {
  late ProductsUseCase _productsUseCase;

  @override
  FutureOr<List<Product>?> build() async {
    return null; // Do not fetch products initially
  }

  Future<List<Product>?> fetchProducts() async {
    state = const AsyncValue.loading();
    _productsUseCase = ProductsUseCase(ref.read(productsRepository));
    final initialList = await _productsUseCase.getProducts();
    state = AsyncValue.data(initialList.isEmpty ? null : initialList);
    return initialList.isEmpty ? null : initialList;
  }
}

final listProvider =
    AutoDisposeAsyncNotifierProvider<ListState, List<Product>?>(ListState.new);
