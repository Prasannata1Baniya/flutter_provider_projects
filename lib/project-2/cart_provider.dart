import 'package:flutter/foundation.dart';
import 'model/cart_item.dart';
import 'model/products_model.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  void addItem(Products product) {
    if (_items.containsKey(product.id)) {
      // If the item exists, increase its quantity
      _items.update(
        product.id!,
            (existingCartItem) => CartItem(
          product: existingCartItem.product,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      // Add a new item to the cart
      _items[product.id!] = CartItem(product: product, quantity: 1);
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  int get itemCount {
    return _items.length;
  }

  double get totalPrice {
    return _items.values
        .fold(0.0, (sum, item) => sum + (item.product.price * item.quantity));
  }
}

