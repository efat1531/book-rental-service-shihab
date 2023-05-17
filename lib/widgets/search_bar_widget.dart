import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color_constant.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 39,
      margin: const EdgeInsets.only(left: 25, right: 25, top: 18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: kLightGreyColor),
      child: Stack(
        children: [
          TextField(
            maxLengthEnforcement: MaxLengthEnforcement.none,
            style: GoogleFonts.openSans(
                fontSize: 12, color: kBlackColor, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(left: 19, right: 50, bottom: 8),
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
              child: SvgPicture.asset('assets/svg/background_search.svg'),
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
                'assets/icons/icon_search_white.svg',
              ),
            ),
          )
        ],
      ),
    );
  }
}
