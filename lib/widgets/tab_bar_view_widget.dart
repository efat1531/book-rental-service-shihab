import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/color_constant.dart';
import '../providers/book_list_provider.dart';

class TabBarViewWidget extends StatelessWidget {
  final int _choosedIndex;
  TabBarViewWidget(this._choosedIndex);

  @override
  Widget build(BuildContext context) {
    final _bookList = _choosedIndex == 1
        ? Provider.of<BookListProvider>(context, listen: false)
            .educationBookList
        : _choosedIndex == 2
            ? Provider.of<BookListProvider>(context, listen: false)
                .fictionBookList
            : Provider.of<BookListProvider>(context, listen: false)
                .nonfictionBookList;
    return ListView.builder(
      padding: EdgeInsets.only(left: 25, right: 6),
      itemCount: _bookList.length,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            print(_bookList[index].title);
          },
          child: Container(
            margin: const EdgeInsets.only(right: 19),
            height: 210,
            width: 153,
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
                _bookList[index].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
