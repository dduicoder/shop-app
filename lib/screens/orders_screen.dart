import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "orders";

  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    final orders = orderData.orders;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: orders.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Text("Your haven't ordered yet.")],
              ),
            )
          : ListView.builder(
              itemBuilder: (ctx, i) => OrderItem(orders[i]),
              itemCount: orders.length,
            ),
    );
  }
}
