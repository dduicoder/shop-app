import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/cart_item.dart';
import '../providers/cart.dart' show Cart;
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "cart";

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final items = cart.items;

    void order() {
      if (cart.itemCount == 0) {
        return;
      }

      Provider.of<Orders>(context, listen: false).addOrder(
        items.values.toList(),
        cart.totalAmount,
      );

      cart.clearCart();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Total",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                    label: Text(
                      "\$${cart.totalAmount.toStringAsFixed(2)} (${cart.itemCount} items)",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Divider(
              height: 1,
              color: Colors.black.withOpacity(0.25),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: cart.itemCount == 0
                  ? const Text("Your cart is empty.")
                  : ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (ctx, i) => CartItem(
                          items.keys.toList()[i], items.values.toList()[i]),
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    cart.clearCart();
                  },
                  child: const Text("Clear All"),
                ),
                ElevatedButton(
                  onPressed: order,
                  child: const Text("Order"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
