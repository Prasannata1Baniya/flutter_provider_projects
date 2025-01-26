import 'package:flutter/material.dart';
import 'package:flutter_provider/project-2/cart_provider.dart';
import 'package:provider/provider.dart';


class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: cartItems.isEmpty
          ? const Center(
        child: Text("Your cart is empty!"),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (ctx, index) {
                final cartItem = cartItems[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${cartItem.quantity}x'),
                  ),
                  title: Text(cartItem.product.title),
                  subtitle: Text(
                      'Price: \$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      cartProvider.removeItem(cartItem.product.id);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
