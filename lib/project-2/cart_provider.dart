import 'package:flutter/foundation.dart';
import 'model/cart_item.dart';
import 'model/products_model.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  void addItem(Products product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity++;
    } else {
      _items[product.id] = CartItem(product: product, quantity: 1);
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  int get itemCount {
    return _items.values.fold(0, (sum, item) => sum + item.quantity);
  }
}



