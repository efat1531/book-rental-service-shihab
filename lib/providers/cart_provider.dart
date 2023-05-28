import 'package:flutter/material.dart';

import '../models/cart.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _cartItem = {};

  Map<String, CartItem> get cartItem {
    return {..._cartItem};
  }

  /// this fuction add item to cart
  void addItem(String bookId, int amount, String title, String imageUrl) {
    if (_cartItem.containsKey(bookId) == false) {
      _cartItem.putIfAbsent(
        bookId,
        () => CartItem(
          id: DateTime.now().toString(),
          amount: amount,
          title: title,
          imageUrl: imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  /// This item to get TotalAmount
  int getTotalAmount() {
    int total = 0;
    _cartItem.forEach((key, value) {
      total += value.amount;
    });
    return total;
  }

  int get getItemLength {
    return _cartItem.length;
  }

  /// This fuction is to remove item from cart
  void removeFromCart(String id) {
    _cartItem.removeWhere((key, value) => key == id);
    notifyListeners();
  }

  void clear() {
    _cartItem.clear();
    notifyListeners();
  }
}
