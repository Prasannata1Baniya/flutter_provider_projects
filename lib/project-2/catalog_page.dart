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
        title: const Center(child: Text("Shopping Cart")),
        actions: [
          InkWell(
              onTap:()=> Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>const ShoppingCart())),
              child:const  Icon(Icons.shopping_bag)),
        ],
      ),
      body: ListView.builder(
          itemCount: productsList.length,
          itemBuilder: (ctx,index){
            final product=productsList[index];

        return Card(
          child: ListTile(
            leading: Container(
              decoration:const  BoxDecoration(
                color:Colors.purpleAccent,
              ),
            ),
              title: Text(product.title),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'), //for decimal number
            //subtitle: Text(product.price as String),
            trailing: ElevatedButton(
              style:ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).addItem(product);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Added to cart!"))
                    );
              },
              child: const Text('Add to Cart'),
            ),
          ),
        );
      })
    );
  }
}
