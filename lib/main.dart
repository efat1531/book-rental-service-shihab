// ignore_for_file: prefer_const_constructors

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../providers/orders_provider.dart';
import './screens/home_screen.dart';
import './providers/book_list_provider.dart';
import './screens/book_detail_screen.dart';
import './screens/all_book_screen.dart';
import './screens/search_book_screen.dart';
import './screens/cart_screen.dart';
import './screens/favourte_screen.dart';
import './screens/order_screen.dart';
import './providers/cart_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /**Book List provider for data and others */
        ChangeNotifierProvider(
          create: (context) => BookListProvider(),
        ),
        /** Cart Provider for cart data and everything else */
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        /**
         * Order Provider for order data and others
         */
        ChangeNotifierProvider(
          create: (context) => OrderProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: HomeScreen(),
        initialRoute: '/home',
        routes: {
          /**
           * Home route /home
           */
          '/home': (context) => HomeScreen(),
          /**
           * Book Detail Screen route for showing book details
           */
          BookDetailScreen.routeName: (context) => BookDetailScreen(),
          /**
           * All book of certain category route for showing books
           */
          AllBookScreen.routeName: (context) => AllBookScreen(),
          /**
           * Search Book Screen for using search bar and view result
           */
          SearchBookScreen.routeName: (context) => SearchBookScreen(),
          /**
           * Order Screen for showing all the orders made by user
           */
          OrderHistoryScreen.routeName: (context) => OrderHistoryScreen(),
          /**
           * Favourite Screen for showing favourite books of the user
           */
          FavouriteScreen.routeName: (context) => FavouriteScreen(),
          /**
           * Cart Screen for showing the items in the cart and edit
           */
          CartScreen.routeName: (context) => CartScreen(),
        },
        /**
         * If any route is not properly loaded.
         */
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) => HomeScreen());
        },
        /**
         * If any route is missing then this will bring to home screen
         */
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (context) => HomeScreen());
        },
      ),
    );
  }
}
