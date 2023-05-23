import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/color_constant.dart';
import '../providers/book_list_provider.dart';
import './book_detail_screen.dart';
import '../widgets/main_drawer.dart';

class SearchBookScreen extends StatelessWidget {
  static String routeName = '/searchBook';

  @override
  Widget build(BuildContext context) {
    String _searchText = ModalRoute.of(context)!.settings.arguments as String;
    final _filteredBookList =
        Provider.of<BookListProvider>(context).searchBook(_searchText);
    return Scaffold(
      drawer: MainDrawer(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, User',
                  style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kGreyColor),
                ),
                Text(
                  'Your search',
                  style: GoogleFonts.openSans(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: kBlackColor),
                ),
              ],
            ),
          ),
          Container(
            height: 39,
            margin: const EdgeInsets.only(left: 25, right: 25, top: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kLightGreyColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 19,
                right: 19,
                //bottom: 8,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _searchText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.openSans(
                    fontSize: 12,
                    color: kGreyColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: Text(
              'Search Result',
              style: GoogleFonts.openSans(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: kBlackColor,
              ),
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: _filteredBookList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    BookDetailScreen.routeName,
                    arguments: _filteredBookList[index].id,
                  );
                },
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
                          _filteredBookList[index].imageUrl,
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
                              _filteredBookList[index].title,
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
                              _filteredBookList[index].authorName,
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
                              '\$${_filteredBookList[index].amount}',
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
          ),
        ],
      ),
    );
  }
}
