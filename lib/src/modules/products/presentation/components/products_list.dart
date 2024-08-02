import 'package:flutter/material.dart';
import 'package:products_app/src/modules/products/data/model/product.dart';
import 'package:products_app/src/modules/products/presentation/components/product_tile.dart';
import 'package:styled_widget/styled_widget.dart';

class ProductsList extends StatelessWidget {
  final ValueNotifier<List<Product>?> products;
  final String defaultImage;
  final Future<void> Function() fetchProducts;

  const ProductsList({
    super.key,
    required this.products,
    required this.defaultImage,
    required this.fetchProducts,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: fetchProducts,
      child: ListView.builder(
        itemCount: products.value!.length,
        itemBuilder: (context, index) {
          final product = products.value![index];
          return ProductTile(
            product: product,
            defaultImage: defaultImage,
          ).padding(horizontal: 5);
        },
      ),
    );
  }
}
