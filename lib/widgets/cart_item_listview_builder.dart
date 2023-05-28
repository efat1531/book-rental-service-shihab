import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/book_list_provider.dart';
import '../providers/cart_provider.dart';
import '../constants/color_constant.dart';

class CartItemListView extends StatelessWidget {
  final String bookId;
  CartItemListView(this.bookId);
  @override
  Widget build(BuildContext context) {
    final _bookDetails = Provider.of<BookListProvider>(context, listen: false)
        .getItemById(bookId);

    return Dismissible(
      key: ValueKey(bookId),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Are you sure about this?'),
          content: const Text('Do want to remove this item from cart?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                'Yes',
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(234, 145, 175, 1),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                'No',
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color:const Color.fromRGBO(234, 145, 175, 1),
                ),
              ),
            ),
          ],
        ),
      ),
      background: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 25,
            child: Icon(
              Icons.delete_forever_outlined,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false)
            .removeFromCart(bookId);
      },
      child: Column(
        children: [
          Card(
            elevation: 5,
            //margin: const EdgeInsets.only(bottom: 15),
            child: Container(
              //margin: const EdgeInsets.only(bottom: 19),
              height: 60,
              width: MediaQuery.of(context).size.width - 50,
              color: kBackgroundColor,
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 49,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: kMainColor,
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      child: Image.network(
                        _bookDetails.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 21,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 15,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _bookDetails.title,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.openSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kBlackColor,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '\$${_bookDetails.amount}',
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: kBlackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
