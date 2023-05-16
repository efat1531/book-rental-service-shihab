import '../widgets/all_book_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_tab_indicator.dart';
import '../widgets/tab_bar_view_widget.dart';

import '../constants/color_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Container(
          child: ListView(
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
              Container(
                height: 39,
                margin: const EdgeInsets.only(left: 25, right: 25, top: 18),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kLightGreyColor),
                child: Stack(
                  children: <Widget>[
                    TextField(
                      maxLengthEnforcement: MaxLengthEnforcement.none,
                      style: GoogleFonts.openSans(
                          fontSize: 12,
                          color: kBlackColor,
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 19, right: 50, bottom: 8),
                          border: InputBorder.none,
                          hintText: 'Search book..',
                          hintStyle: GoogleFonts.openSans(
                              fontSize: 12,
                              color: kGreyColor,
                              fontWeight: FontWeight.w600)),
                    ),
                    Positioned(
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          print('User has tapped');
                        },
                        child: SvgPicture.asset(
                            'assets/svg/background_search.svg'),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 9,
                      child: InkWell(
                        onTap: () {
                          print('User has Tapped');
                        },
                        child: SvgPicture.asset(
                            'assets/icons/icon_search_white.svg'),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 25,
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.only(left: 25),
                child: TabBar(
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
              ),
              Container(
                margin: const EdgeInsets.only(top: 21),
                height: 210,
                child: TabBarView(
                  children: [
                    TabBarViewWidget(1),
                    TabBarViewWidget(2),
                    TabBarViewWidget(3),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 25),
                child: Text(
                  'All Books',
                  style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: kBlackColor,
                  ),
                ),
              ),
              AllBookListViewBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
