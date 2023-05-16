// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/color_constant.dart';
import '../providers/book_list_provider.dart';

class AllBookListViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookList =
        Provider.of<BookListProvider>(context, listen: false).bookList;
    return ListView.builder(
        padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          GestureDetector(
            onTap: () {
              print('ListView Tapped');
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 19),
              height: 81,
              width: MediaQuery.of(context).size.width - 50,
              color: kBackgroundColor,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 81,
                    width: 62,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kMainColor,
                    ),
                  ),
                  const SizedBox(
                    width: 21,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        bookList[index].title,
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
                        //populars[index].author,
                        'Hello',
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
                        '\$${bookList[index].amount}',
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kBlackColor,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
