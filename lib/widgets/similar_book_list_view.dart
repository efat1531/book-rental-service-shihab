import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../constants/color_constant.dart';
import '../providers/book_list_provider.dart';
import '../models/bookItem.dart';

class SimilarBookListViewBuilder extends StatelessWidget {
  // ignore: slash_for_doc_comments
  /**
   * This control which book we are receiving 
   */
  final BookItem _receivedBook;
  const SimilarBookListViewBuilder(this._receivedBook);

  @override
  Widget build(BuildContext context) {
    /**
     * Fetching similar books of that category in random order
     */
    final similarBookList =
        Provider.of<BookListProvider>(context).similarBookList(_receivedBook);
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25,top: 10),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: similarBookList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
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
                    similarBookList[index].imageUrl,
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
                        similarBookList[index].title,
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
                        similarBookList[index].authorName,
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
                        '\$${similarBookList[index].amount}',
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
          );
        },
      ),
    );
  }
}
