import 'package:flutter/material.dart';
import 'package:flutter_provider/project-2/cart_provider.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Shopping Cart")),
      ),
      body: cart.items.isEmpty
          ?const Center(child: Text('Your cart is empty!'))
          : ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (ctx, index) {
          final cartItem = cart.items.values.toList()[index];
          return ListTile(
            title: Text(cartItem.product.title),
            subtitle: Text('Quantity: ${cartItem.quantity}'),
            trailing: Text('\$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
