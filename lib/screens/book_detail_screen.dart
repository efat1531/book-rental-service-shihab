import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/color_constant.dart';
import 'package:flutter/material.dart';
import '../providers/book_list_provider.dart';
import '../providers/cart_provider.dart';

class BookDetailScreen extends StatefulWidget {
  static String routeName = '/bookDetails';

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  Widget build(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final bookId = ModalRoute.of(context)!.settings.arguments as String;
    final bookDetails = Provider.of<BookListProvider>(context, listen: false)
        .getItemById(bookId);
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
        height: 49,
        color: Colors.transparent,
        child: TextButton(
          onPressed: () {
            Provider.of<CartProvider>(context, listen: false)
                .addItem(bookDetails.id, bookDetails.amount, bookDetails.title);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                content: Text(
                  'Added to cart',
                  style: GoogleFonts.openSans(
                    fontSize: 15,
                  ),
                ),
                action: SnackBarAction(
                  label: 'Undo',
                  disabledTextColor: kWhiteColor,
                  textColor: Colors.amber[700],
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .removeFromCart(bookId);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
              ),
            );
          },
          style: TextButton.styleFrom(
            backgroundColor: kMainColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text(
            'Add to Cart',
            style: GoogleFonts.openSans(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: kWhiteColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: kMainColor,
                expandedHeight: MediaQuery.of(context).size.height * 0.5,
                flexibleSpace: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 25,
                        top: 35,
                        child: GestureDetector(
                          onTap: () {
                            if (Navigator.of(context).canPop()) {
                              Navigator.of(context).pop();
                            } else {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/home', (route) => false);
                            }
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: kWhiteColor,
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/icon_back_arrow.svg',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 25,
                        top: 35,
                        child: GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                elevation: 5,
                                behavior: SnackBarBehavior.floating,
                                //backgroundColor: Colors.black87,
                                content: Text(
                                  bookDetails.isFavourite
                                      ? 'Removed from favourites.'
                                      : 'Added in favourites',
                                  style: GoogleFonts.openSans(
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                            setState(
                              () {
                                bookDetails.isFavourite =
                                    !bookDetails.isFavourite;
                              },
                            );
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: kWhiteColor,
                            ),
                            child: bookDetails.isFavourite
                                ? const Icon(
                                    Icons.favorite,
                                    color: kMainColor,
                                  )
                                : const Icon(
                                    Icons.favorite_border_outlined,
                                    color: kMainColor,
                                  ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 62),
                          width: 170,
                          height: 225,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.network(
                              bookDetails.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.only(top: 24, left: 25),
                      child: Text(
                        bookDetails.title,
                        style: GoogleFonts.openSans(
                            fontSize: 27,
                            color: kBlackColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7, left: 25),
                      child: Text(
                        bookDetails.authorName,
                        style: GoogleFonts.openSans(
                            fontSize: 14,
                            color: kGreyColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7, left: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$',
                            style: GoogleFonts.openSans(
                                fontSize: 14,
                                color: kMainColor,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${bookDetails.amount}',
                            style: GoogleFonts.openSans(
                                fontSize: 32,
                                color: kMainColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 28,
                      margin: const EdgeInsets.only(top: 23, bottom: 15),
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        margin: const EdgeInsets.only(right: 39),
                        child: Text(
                          'Description',
                          style: GoogleFonts.openSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 25),
                      child: Text(
                        bookDetails.description,
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: kGreyColor,
                          letterSpacing: 1.5,
                          height: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
