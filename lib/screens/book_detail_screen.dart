import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/color_constant.dart';
import 'package:flutter/material.dart';
import '../providers/book_list_provider.dart';
import '../widgets/custom_tab_indicator.dart';

class BookDetailScreen extends StatelessWidget {
  static String routeName = '/bookDetails';
  @override
  Widget build(BuildContext context) {
    final bookId = ModalRoute.of(context)!.settings.arguments as String;
    final bookDetails = Provider.of<BookListProvider>(context, listen: false)
        .getItemById(bookId);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: kMainColor,
                expandedHeight: MediaQuery.of(context).size.height * 0.5,
                flexibleSpace: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 25,
                        top: 35,
                        child: GestureDetector(
                          onTap: () {
                            if (Navigator.of(context).canPop()) {
                              Navigator.of(context).pop();
                            } else {
                              print('I am hero');
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
                        right: 25,
                        top: 35,
                        child: GestureDetector(
                          onTap: () {
                            print('User tapped the icon');
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: kWhiteColor,
                            ),
                            child: bookDetails.isFavourite
                                ? const Icon(Icons.favorite)
                                : const Icon(Icons.favorite_border_outlined),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 62),
                          width: 170,
                          height: 225,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.network(
                              bookDetails.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: EdgeInsets.only(top: 24, left: 25),
                      child: Text(
                        bookDetails.title,
                        style: GoogleFonts.openSans(
                            fontSize: 27,
                            color: kBlackColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7, left: 25),
                      child: Text(
                        bookDetails.authorName,
                        style: GoogleFonts.openSans(
                            fontSize: 14,
                            color: kGreyColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7, left: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$',
                            style: GoogleFonts.openSans(
                                fontSize: 14,
                                color: kMainColor,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${bookDetails.amount}',
                            style: GoogleFonts.openSans(
                                fontSize: 32,
                                color: kMainColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 28,
                      margin: const EdgeInsets.only(top: 23, bottom: 36),
                      padding: const EdgeInsets.only(left: 25),
                      child: DefaultTabController(
                        length: 1,
                        child: TabBar(
                          labelPadding: const EdgeInsets.all(0),
                          indicatorPadding: const EdgeInsets.all(0),
                          isScrollable: true,
                          labelColor: kBlackColor,
                          unselectedLabelColor: kGreyColor,
                          labelStyle: GoogleFonts.openSans(
                              fontSize: 14, fontWeight: FontWeight.w700),
                          unselectedLabelStyle: GoogleFonts.openSans(
                              fontSize: 14, fontWeight: FontWeight.w600),
                          indicator: RoundedRectangleTabIndicator(
                              weight: 2, width: 30, color: kBlackColor),
                          tabs: [
                            Tab(
                              child: Container(
                                margin: const EdgeInsets.only(right: 39),
                                child: const Text('Description'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                      child: Text(
                        bookDetails.description,
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: kGreyColor,
                          letterSpacing: 1.5,
                          height: 2,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
