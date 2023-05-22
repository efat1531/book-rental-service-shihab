import './cart.dart';

class OrderItem {
  final String orderId;
  final int amount;
  final List<CartItem> listOfBooks;
  final DateTime dateTime;
  OrderItem({
    required this.amount,
    required this.orderId,
    required this.listOfBooks,
    required this.dateTime,
  });
}
