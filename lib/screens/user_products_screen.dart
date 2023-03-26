import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = "/user-products";

  const UserProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final items = products.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text("User Products"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemBuilder: (_, i) => Column(
            children: [
              UserProductItem(
                items[i].title,
                items[i].imageUrl,
              ),
              const Divider(),
            ],
          ),
          itemCount: items.length,
        ),
      ),
    );
  }
}
