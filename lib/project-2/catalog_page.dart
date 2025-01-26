import 'package:flutter/material.dart';
import 'package:flutter_provider/project-2/cart_provider.dart';
import 'package:flutter_provider/project-2/model/products_model.dart';
import 'package:flutter_provider/project-2/shopping_cart.dart';
import 'package:provider/provider.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Products> productsList = [
      Products(id: '1', title: 'Product 1', price: 29.99),
      Products(id: '2', title: 'Product 2', price: 19.99),
      Products(id: '3', title: 'Product 3', price: 9.99),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Shopping Cart App")),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ShoppingCart()),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: productsList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) {
          final product = productsList[index];
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text('\$${product.price.toStringAsFixed(2)}'),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addItem(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${product.title} added to cart!"),
                      ),
                    );
                  },
                  child: const Text('Add to Cart'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
