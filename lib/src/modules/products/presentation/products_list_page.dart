import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:products_app/src/modules/products/data/model/product.dart';
import 'package:products_app/src/modules/products/presentation/components/products_list.dart';
import 'package:products_app/src/utils/async_value_ui.dart';
import 'package:styled_widget/styled_widget.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_hooks/flutter_hooks.dart';

import 'state/button_state.dart';
import 'state/list_state.dart';

class ProductsListPage extends HookConsumerWidget {
  const ProductsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const defaultImage =
        "https://e7.pngegg.com/pngimages/498/183/png-clipart-homer-simpson-homer-simpson-eating-a-donut-at-the-movies-cartoons.png";

    final isBtnVisible = ref.watch(buttonProvider);

    final products = useState<List<Product>?>([]);

    final state = ref.watch(listProvider);
    ref.listen<AsyncValue<List<Product>?>>(listProvider, (_, state) {
      if (state.hasValue) {
        products.value = state.value;
      }
      state.showErrorSnackBar(
        context,
        errorMessage: "An error has occured while fetching the products.",
      );
    });

    Future<void> fetchProducts() async {
      await ref.read(listProvider.notifier).fetchProducts();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products List"),
        centerTitle: false,
      ),
      body: Center(
        child: isBtnVisible
            ? ElevatedButton(
                onPressed: fetchProducts,
                child: const Text("Fetch Products"),
              )
            : state.when(
                data: (data) {
                  return data == null ||
                          products.value == null ||
                          products.value!.isEmpty
                      ? const Text(
                          "No products were found",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ).center()
                      : ProductsList(
                          products: products,
                          defaultImage: defaultImage,
                          fetchProducts: fetchProducts,
                        );
                },
                loading: () => const CircularProgressIndicator(),
                error: (Object error, StackTrace stackTrace) {
                  return null;
                },
              ),
      ),
    );
  }
}
