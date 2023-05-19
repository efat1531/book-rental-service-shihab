import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color_constant.dart';
import '../screens/search_book_screen.dart';

class SearchBarWidget extends StatelessWidget {
  //const SearchBarWidget({super.key});

  final searchBarInput = TextEditingController();

  void clearTextFeild() {
    searchBarInput.clear();
  }

  @override
  Widget build(BuildContext context) {
    void searchBarButtonPressed() {
      final String inputText = searchBarInput.text;
      print('User has tapped -> ${inputText}');
      clearTextFeild();
      Navigator.of(context)
          .pushNamed(SearchBookScreen.routeName, arguments: inputText);
    }

    return Container(
      height: 39,
      margin: const EdgeInsets.only(left: 25, right: 25, top: 18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: kLightGreyColor),
      child: Stack(
        children: [
          TextField(
            controller: searchBarInput,
            maxLengthEnforcement: MaxLengthEnforcement.none,
            style: GoogleFonts.openSans(
                fontSize: 12, color: kBlackColor, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(left: 19, right: 50, bottom: 8),
              border: InputBorder.none,
              hintText: 'Search book..',
              hintStyle: GoogleFonts.openSans(
                  fontSize: 12, color: kGreyColor, fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () {
                searchBarButtonPressed();
              },
              child: SvgPicture.asset('assets/svg/background_search.svg'),
            ),
          ),
          Positioned(
            top: 8,
            right: 9,
            child: InkWell(
              onTap: () {
                searchBarButtonPressed();
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
