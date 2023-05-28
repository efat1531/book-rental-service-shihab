import 'package:book_rental_service/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/order.dart';

class OrderItemListViewBuilder extends StatefulWidget {
  final OrderItem orderItem;
  OrderItemListViewBuilder(this.orderItem);

  @override
  State<OrderItemListViewBuilder> createState() =>
      _OrderItemListViewBuilderState();
}

class _OrderItemListViewBuilderState extends State<OrderItemListViewBuilder> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: const EdgeInsets.all(10),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            minLeadingWidth: 10,
            leading:const SizedBox(
              height: double.infinity,
              child: Icon(
                Icons.timer_sharp,
                size: 30,
                color: Color.fromRGBO(217, 146, 167, 1),
              ),
            ),
            title: Text(
              widget.orderItem.orderId,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.raleway(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: kBlackColor,
              ),
            ),
            subtitle: Text(
              DateFormat.yMMMMd('en_US').format(widget.orderItem.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(
                _expanded
                    ? Icons.expand_less_rounded
                    : Icons.expand_more_rounded,
                size: 30,
                color: const Color.fromRGBO(217, 146, 167, 1),
              ),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  children: widget.orderItem.listOfBooks
                      .map(
                        (element) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 38,
                                    height: 50,
                                    child: Image.network(element.imageUrl),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      element.title,
                                      style: GoogleFonts.openSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Flexible(
                                      fit: FlexFit.tight, child: SizedBox()),
                                  Text(
                                    '${element.amount} TK',
                                    style: GoogleFonts.openSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: kGreyColor,
                                    ),
                                    ///textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
                const Divider(
                  thickness: 0.5,
                  color: kGreyColor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Amount :',
                        style: GoogleFonts.openSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${widget.orderItem.amount} TK',
                        style: GoogleFonts.openSans(
                          fontSize: 15,
                          color: Colors.blueGrey[600],
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
