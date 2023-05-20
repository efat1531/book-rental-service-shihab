import 'package:flutter/material.dart';

import '../models/cart.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _cartItem = {};

  Map<String, CartItem> get cartItem {
    return {..._cartItem};
  }

  void addItem(String bookId, int amount, String title) {
    if (!_cartItem.containsKey(bookId)) {
      _cartItem.putIfAbsent(
        bookId,
        () => CartItem(
            id: DateTime.now().toString(), amount: amount, title: title),
      );
    }
  }
}
