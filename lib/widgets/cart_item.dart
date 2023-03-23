import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' as cart;

class CartItem extends StatelessWidget {
  final String productId;
  final cart.CartItem cartItem;

  const CartItem(this.productId, this.cartItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Dismissible(
          key: ValueKey(cartItem.id),
          background: Container(
            padding: const EdgeInsets.only(right: 24),
            color: Colors.red,
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.delete_rounded,
              color: Colors.white,
              size: 32,
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            Provider.of<cart.Cart>(context, listen: false)
                .removeItem(productId);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
            ),
            child: ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\$${cartItem.price}",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              title: Text(cartItem.title),
              subtitle: Text("Total: \$${cartItem.price * cartItem.quantity}"),
              trailing: Text("${cartItem.quantity} X"),
            ),
          ),
        ),
      ),
    );
  }
}
