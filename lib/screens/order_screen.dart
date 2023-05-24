// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/color_constant.dart';
import '../providers/orders_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/main_drawer.dart';
import '../widgets/order_item.dart';

class OrderHistoryScreen extends StatelessWidget {
  static String routeName = '/home/orders';
  @override
  Widget build(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final orderData = Provider.of<OrderProvider>(context);
    return Scaffold(
      drawer: MainDrawer(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: Text(
              'Your Orders',
              style: GoogleFonts.openSans(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: kBlackColor),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 10, right: 25, left: 25),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return OrderItemListViewBuilder(orderData.orders[index]);
            },
            itemCount: orderData.orders.length,
          ),
        ],
      ),
    );
  }
}
