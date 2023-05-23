// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/color_constant.dart';
import '../providers/book_list_provider.dart';
import '../screens/book_detail_screen.dart';

class PopularBookListViewBuilder extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    /** Received the Book List for display */
    final _bookList =
        Provider.of<BookListProvider>(context).popularList;
    /** This will build the list for display data */
    return ListView.builder(
      padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: _bookList.length,
      itemBuilder: (context, index) {
        /**
         * This will detect if user wants to see any book details. If want it will take it forward
         */
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              BookDetailScreen.routeName,
              arguments: _bookList[index].id,
            );
          },
          /**
           * Here we build the UI how a book can be shown to user on the list
           */
          child: Container(
            margin: const EdgeInsets.only(bottom: 19),
            height: 81,
            width: MediaQuery.of(context).size.width - 50,
            color: kBackgroundColor,
            child: Row(
              children: [
                Container(
                  height: 81,
                  width: 62,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: kMainColor,
                  ),
                  child: Image.network(
                    _bookList[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 21,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _bookList[index].title,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: kBlackColor,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        _bookList[index].authorName,
                        style: GoogleFonts.openSans(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: kGreyColor,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '\$${_bookList[index].amount}',
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kBlackColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
