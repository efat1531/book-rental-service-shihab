import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/book_list_provider.dart';
import '../screens/book_detail_screen.dart';
import '../constants/color_constant.dart';

class AllBookScreen extends StatelessWidget {
  static String routeName = '/home/allbooks';

  @override
  Widget build(BuildContext context) {
    final int choosedType = ModalRoute.of(context)!.settings.arguments as int;
    final bookList = choosedType == 0
        ? Provider.of<BookListProvider>(context).educationBookList
        : choosedType == 1
            ? Provider.of<BookListProvider>(context).fictionBookList
            : Provider.of<BookListProvider>(context).nonfictionBookList;
    final String titleToDisplay = choosedType == 0
        ? 'Only Education Books'
        : choosedType == 1
            ? 'Only Fiction Books'
            : 'Only Non-Fiction Books';
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: kMainColor,
                expandedHeight: 190,
                flexibleSpace: Stack(
                  children: [
                    Container(
                      height: 190,
                      width: double.infinity,
                      child: Image.asset('assets/images/edu_poster.png'),
                    ),
                    Positioned(
                      left: 25,
                      top: 35,
                      child: GestureDetector(
                        onTap: () {
                          if (Navigator.of(context).canPop()) {
                            Navigator.of(context).pop();
                          } else {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/home', (route) => false);
                          }
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kWhiteColor,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/icon_back_arrow.svg',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 6,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(8),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            titleToDisplay,
                            style: GoogleFonts.raleway(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding:
                        const EdgeInsets.only(top: 25, right: 25, left: 25),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            BookDetailScreen.routeName,
                            arguments: bookList[index].id,
                          );
                        },
                        child: Column(
                          children: [
                            Card(
                              elevation: 3,
                              child: Container(
                                //margin: const EdgeInsets.only(bottom: 19),
                                height: 81,
                                width: MediaQuery.of(context).size.width - 50,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                  color: kBackgroundColor,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 81,
                                      width: 62,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: kMainColor,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                          bookList[index].imageUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 21,
                                    ),
                                    Flexible(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            bookList[index].title,
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
                                            bookList[index].authorName,
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
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 19,
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: bookList.length,
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
