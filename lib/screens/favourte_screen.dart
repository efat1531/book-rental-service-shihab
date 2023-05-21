// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/color_constant.dart';
import '../providers/book_list_provider.dart';
import './book_detail_screen.dart';

class FavouriteScreen extends StatefulWidget {
  static String routeName = '/home/favourites';

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final bookList = Provider.of<BookListProvider>(context).favourites;
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: Text(
              'Your Favourites',
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
            padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    BookDetailScreen.routeName,
                    arguments: bookList[index].id,
                  );
                },
                child: Column(
                  children: [
                    Card(
                      elevation: 3,
                      child: Container(
                        //margin: const EdgeInsets.only(bottom: 19),
                        height: 81,
                        width: MediaQuery.of(context).size.width - 50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                          color: kBackgroundColor,
                        ),
                        /** Make the list dimissible so user can dismiss their favourites at any time */
                        child: Dismissible(
                          onDismissed: (direction) {
                            setState(() {
                              bookList[index].isFavourite =
                                  !bookList[index].isFavourite;
                            });
                          },
                          key: ValueKey(bookList[index].id),
                          background: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              color: Colors.red,
                            ),
                            alignment: Alignment.centerRight,
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Icon(
                                Icons.delete_outlined,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                          direction: DismissDirection.endToStart,
                          child: Row(
                            children: [
                              Container(
                                height: 81,
                                width: 62,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: kMainColor,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    bookList[index].imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 21,
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      bookList[index].title,
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
                                      bookList[index].authorName,
                                      style: GoogleFonts.openSans(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: kGreyColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '\$${bookList[index].amount}',
                                      style: GoogleFonts.openSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: kBlackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                  ],
                ),
              );
            },
            itemCount: bookList.length,
          ),
        ],
      ),
    );
  }
}
