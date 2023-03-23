import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavoritesOnly;

  const ProductsGrid(this.showFavoritesOnly, {super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        showFavoritesOnly ? productsData.favotieItems : productsData.items;

    return products.isEmpty
        ? const Padding(
            padding: EdgeInsets.all(16),
            child: Text("No Products"),
          )
        : GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            itemBuilder: (ctx, index) {
              final item = products[index];

              return ChangeNotifierProvider.value(
                value: item,
                child: ProductItem(
                  key: Key(item.id),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
          );
  }
}
