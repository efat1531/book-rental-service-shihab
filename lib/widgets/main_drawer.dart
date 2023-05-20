import 'package:google_fonts/google_fonts.dart';

import '../constants/color_constant.dart';
import 'package:flutter/material.dart';

import '../screens/cart_screen.dart';
import '../screens/favourte_screen.dart';
import '../screens/order_screen.dart';

class MainDrawer extends StatelessWidget {
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
          const Divider(
            thickness: 1.2,
            color: Color.fromRGBO(191, 191, 191, 1),
          ),
          /**
           * This list tile for Home. User will go to home screen
           */
          ListTile(
            minLeadingWidth: 2,
            leading: const Icon(
              Icons.home,
              color: kMainColor,
            ),
            title: Text(
              'Home',
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/home', (route) => false);
            },
          ),
          const Divider(
            thickness: 1.2,
            color: Color.fromRGBO(191, 191, 191, 1),
          ),
          /**
           * This list tile for Order Screen. User will go to order screen.
           */
          ListTile(
            minLeadingWidth: 2,
            leading: const Icon(
              Icons.assignment_outlined,
              color: kMainColor,
            ),
            title: Text(
              'Orders',
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(OrderHistoryScreen.routeName);
            },
          ),
          const Divider(
            thickness: 1.2,
            color: Color.fromRGBO(191, 191, 191, 1),
          ),
          /**
           * This list tile is used for Cart. User will go to cart screen
           */
          ListTile(
            minLeadingWidth: 2,
            leading: const Icon(
              Icons.shopping_cart_outlined,
              color: kMainColor,
            ),
            title: Text(
              'Cart',
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
          const Divider(
            thickness: 1.2,
            color: Color.fromRGBO(191, 191, 191, 1),
          ),
          /**
           * This list tile is used for Favourite Books. User will go to favourite Screen
           */
          ListTile(
            minLeadingWidth: 2,
            leading: const Icon(
              Icons.star_outline_rounded,
              color: kMainColor,
            ),
            title: Text(
              'Favourites',
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(FavouriteScreen.routeName);
            },
          ),
          const Divider(
            thickness: 1.2,
            color: Color.fromRGBO(191, 191, 191, 1),
          ),
        ],
      ),
    );
  }
}
