import 'package:google_fonts/google_fonts.dart';

import '../constants/color_constant.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon) {
    return ListTile(
      minLeadingWidth: 2,
      leading: Icon(
        icon,
      ),
      title: Text(
        title,
        style: GoogleFonts.openSans(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 15,
        ),
      ),
      onTap: () {
        print('Something please');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
            width: double.infinity,
            child: Text(
              'Hi User',
              style: GoogleFonts.sourceSans3(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: kGreyColor,
              ),
            ),
            //color: kMainColr,
          ),
          /**
           * Welcome text 
           */
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            child: Text(
              'Welcome to the app',
              style: GoogleFonts.sourceSans3(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: kBlackColor,
              ),
            ),
            //color: kMainColr,
          ),
          /**
           * Create a line for visual demonstration
           */
          const Divider(),
          buildListTile('Home', Icons.home),

        ],
      ),
    );
  }
}
