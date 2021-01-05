import 'package:flutter/material.dart';
import 'package:flutter_training_2/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartList => _cartItems;

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  double get totalPrice {
    double total = 0.0;
    _cartItems.forEach((p) {
      total += p.price;
    });
    return total;
  }
}
