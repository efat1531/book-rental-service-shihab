import '../widgets/popular_book_listView_builder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_tab_indicator.dart';
import '../widgets/tab_bar_view_widget.dart';
import '../widgets/search_bar_widget.dart';
import '../constants/color_constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Builder(builder: (context) {
        return Scaffold(
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
                      'Discover Latest Book',
                      style: GoogleFonts.openSans(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: kBlackColor),
                    ),
                  ],
                ),
              ),
              // ignore: prefer_const_constructors
              SearchBarWidget(),
              Container(
                height: 25,
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TabBar(
                      labelPadding: const EdgeInsets.all(0),
                      indicatorPadding: const EdgeInsets.all(0),
                      isScrollable: true,
                      labelColor: kBlackColor,
                      unselectedLabelColor: kGreyColor,
                      labelStyle: GoogleFonts.openSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      unselectedLabelStyle: GoogleFonts.openSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      indicator: RoundedRectangleTabIndicator(
                        weight: 2,
                        width: 10,
                        color: kBlackColor,
                      ),
                      tabs: [
                        Tab(
                          child: Container(
                            margin: const EdgeInsets.only(right: 23),
                            child: const Text('Education'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            margin: const EdgeInsets.only(right: 23),
                            child: const Text('Fiction'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            margin: const EdgeInsets.only(right: 23),
                            child: const Text('Non Fiction'),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        print(
                            'Current selected index -> ${DefaultTabController.of(context).index}');
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                      ),
                      child: Text(
                        'See all',
                        style: GoogleFonts.openSans(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: kMainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 21),
                height: 210,
                child: TabBarView(
                  children: [
                    TabBarViewWidget(0),
                    TabBarViewWidget(1),
                    TabBarViewWidget(2),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 25),
                child: Text(
                  'Popular Books',
                  style: GoogleFonts.openSans(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: kBlackColor,
                  ),
                ),
              ),
              PopularBookListViewBuilder(),
            ],
          ),
        );
      }),
    );
  }
}
