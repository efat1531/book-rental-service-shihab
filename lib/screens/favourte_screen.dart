// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/color_constant.dart';
import '../providers/book_list_provider.dart';
import './book_detail_screen.dart';
import '../widgets/main_drawer.dart';

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
      drawer: MainDrawer(),
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
                  Navigator.of(context).pushReplacementNamed(
                    BookDetailScreen.routeName,
                    arguments: bookList[index].id,
                  );
                },
                child: Column(
                  children: [
                    Dismissible(
                      onDismissed: (direction) {
                        setState(() {
                          bookList[index].isFavourite =
                              !bookList[index].isFavourite;
                        });
                      },
                      confirmDismiss: (direction) => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Are you sure about this?'),
                          content: Text(
                              'Do you want to remove this from favourites?'),
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
                                  color: Color.fromRGBO(234, 145, 175, 1),
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
                                  color: Color.fromRGBO(234, 145, 175, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      key: ValueKey(bookList[index].id),
                      background: Align(
                        alignment: Alignment.centerRight,
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 30,
                            child: Icon(
                              Icons.delete_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      direction: DismissDirection.endToStart,
                      child: Card(
                        elevation: 3,
                        child: Container(
                          height: 81,
                          width: MediaQuery.of(context).size.width - 50,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                            color: kBackgroundColor,
                          ),
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
