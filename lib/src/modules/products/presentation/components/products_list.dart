import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:products_app/src/modules/products/data/model/product.dart';
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
          return Card(
            child: ListTile(
              leading: CachedNetworkImage(
                imageUrl: product.thumbnail ?? defaultImage,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              title: [
                Text(product.title ?? "Missing title").fontSize(16).bold(),
                Text(
                  product.description ?? "Missing description",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text("Price: ${product.price} CHF")
              ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
            ),
          ).padding(horizontal: 5);
        },
      ),
    );
  }
}
