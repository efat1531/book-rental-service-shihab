// ignore_for_file: prefer_const_constructors

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../constants/color_constant.dart';
import '../widgets/main_drawer.dart';
import '../widgets/cart_item_listview_builder.dart';
import '../providers/orders_provider.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/home/cart';

  @override
  Widget build(BuildContext context) {
    final cartItemProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      drawer: MainDrawer(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: Text(
              'Your Cart',
              style: GoogleFonts.openSans(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: kBlackColor),
            ),
          ),
          Card(
            margin: EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 25,
              right: 25,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Amount: ${cartItemProvider.getTotalAmount()}',
                        style: GoogleFonts.raleway(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Total Items: ${cartItemProvider.getItemLength}',
                        style: GoogleFonts.raleway(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: kGreyColor,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<OrderProvider>(context, listen: false)
                          .addOrder(
                        cartItemProvider.getTotalAmount(),
                        cartItemProvider.cartItem.values.toList(),
                      );
                      cartItemProvider.clear();
                    },
                    child: Text(
                      'Order Now',
                      style: GoogleFonts.raleway(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kMainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(right: 25, left: 25),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return CartItemListView(
                  cartItemProvider.cartItem.keys.toList()[index]);
            },
            itemCount: cartItemProvider.getItemLength,
          ),
        ],
      ),
    );
  }
}
