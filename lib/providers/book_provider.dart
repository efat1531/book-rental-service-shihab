import 'package:flutter/widgets.dart';

enum Categories {
  education,
  fiction,
  nonfiction,
}

class BookItem extends ChangeNotifier {
  final String id;
  final String title;
  final int amount;
  final int quantity;
  bool isFavourite = false;
  final String description;
  final String authorName;
  final Categories category;
  final String imageUrl;
  final int bookSold;
  BookItem({
    required this.id,
    required this.title,
    required this.authorName,
    required this.amount,
    required this.description,
    required this.quantity,
    required this.category,
    required this.imageUrl,
    required this.bookSold,
  });
}
