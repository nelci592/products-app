import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:products_app/src/modules/products/data/model/product.dart';
import 'package:styled_widget/styled_widget.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final String defaultImage;

  const ProductTile({
    super.key,
    required this.product,
    required this.defaultImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: product.thumbnail ?? defaultImage,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        title: [
          Text(product.title ?? "Missing title").fontSize(16).bold(),
          Text(
            product.description ?? "Missing description",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text("Price: ${product.price} CHF"),
        ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
      ),
    );
  }
}
