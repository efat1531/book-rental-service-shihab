import 'package:flutter/material.dart';

import '../models/order.dart';

class OrderProvider with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }
  /** This function add order to list at index 0 */
  void addOrder(int amount, var listofBooks) {
    _orders.insert(
      0,
      OrderItem(
        amount: amount,
        orderId: DateTime.now().toString(),
        listOfBooks: listofBooks,
        dateTime: DateTime.now(),
      ),
    );
  }
}
