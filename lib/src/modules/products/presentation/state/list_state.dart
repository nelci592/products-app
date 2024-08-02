import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:products_app/src/modules/products/data/model/product.dart';
import 'package:products_app/src/modules/products/data/repository/products.dart';
import 'package:products_app/src/modules/products/domain/use_case/products_use_case.dart';
import 'package:products_app/src/modules/products/presentation/state/button_state.dart';

class ListState extends AutoDisposeAsyncNotifier<List<Product>?> {
  late ProductsUseCase _productsUseCase;

  @override
  FutureOr<List<Product>?> build() async {
    return null; // Do not fetch products initially
  }

  Future<List<Product>?> fetchProducts() async {
    try {
      ref.read(buttonProvider.notifier).changeVisibility();
      state = const AsyncValue.loading();
      _productsUseCase = ProductsUseCase(ref.read(productsRepository));
      final initialList = await _productsUseCase.getProducts();
      state = AsyncValue.data(initialList.isEmpty ? null : initialList);
      return initialList.isEmpty ? null : initialList;
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
      ref.read(buttonProvider.notifier).changeVisibility();
      return null;
    }
  }
}

final listProvider =
    AutoDisposeAsyncNotifierProvider<ListState, List<Product>?>(ListState.new);
