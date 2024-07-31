import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:products_app/src/modules/products/data/model/product.dart';
import 'package:products_app/src/modules/products/presentation/pages/%20list%20page/state/list_state.dart';
import 'package:products_app/src/utils/async_value_ui.dart';
import 'package:styled_widget/styled_widget.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_hooks/flutter_hooks.dart';

class ProductsListPage extends HookConsumerWidget {
  const ProductsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(listProvider);
    final products = useState<List<Product>?>([]);

    ref.listen<AsyncValue>(listProvider, (_, state) {
      if (!state.hasError && !state.isLoading) {
        products.value = state.value;
      }
      state.showErrorSnackBar(context);
    });

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Products List',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          centerTitle: false,
        ),
        body: Container(
          child: state.when(
            data: (data) {
              return data == null || products.value == null
                  ? const Text(
                      "No products were found",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ).center()
                  : ListView.builder(
                      itemCount: products.value!.length,
                      itemBuilder: (context, index) {
                        final product = products.value![index];
                        return ListTile(
                          leading: Text(product.title ?? "Missing title"),
                          subtitle: Text(
                              product.description ?? "Missing description"),
                        );
                      },
                    );
            },
            error: (error, _) => Text(
              "Error: $error",
              textAlign: TextAlign.center,
            ).center().height(200),
            loading: () => const CircularProgressIndicator().center(),
          ),
        ).width(double.infinity).height(double.infinity));
  }
}
