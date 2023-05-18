import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/color_constant.dart';
import '../providers/book_list_provider.dart';
import '../screens/book_detail_screen.dart';

class TabBarViewWidget extends StatelessWidget {
  final int _choosedIndex;
  TabBarViewWidget(this._choosedIndex);

  @override
  Widget build(BuildContext context) {
    final bookList = _choosedIndex == 0
        ? Provider.of<BookListProvider>(context)
            .educationBookList
        : _choosedIndex == 1
            ? Provider.of<BookListProvider>(context)
                .fictionBookList
            : Provider.of<BookListProvider>(context)
                .nonfictionBookList;
    return ListView.builder(
      padding: const EdgeInsets.only(left: 25, right: 6),
      itemCount: bookList.length,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              BookDetailScreen.routeName,
              arguments: bookList[index].id,
            );
          },
          child: Container(
            margin: const EdgeInsets.only(right: 19),
            height: 225,
            width: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kMainColor,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                bookList[index].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
