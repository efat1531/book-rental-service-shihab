// ignore_for_file: prefer_const_constructors

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import './screens/home_screen.dart';
import './providers/book_list_provider.dart';
import './screens/book_detail_screen.dart';
import './screens/all_book_screen.dart';
import './screens/search_book_screen.dart';
import './screens/cart_screen.dart';
import './screens/favourte_screen.dart';
import './screens/order_screen.dart';

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
        ChangeNotifierProvider(
          create: (context) => BookListProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: HomeScreen(),
        initialRoute: '/home',
        routes: {
          '/home': (context) => HomeScreen(),
          BookDetailScreen.routeName: (context) => BookDetailScreen(),
          AllBookScreen.routeName: (context) => AllBookScreen(),
          SearchBookScreen.routeName: (context) => SearchBookScreen(),
          OrderHistoryScreen.routeName: (context) => OrderHistoryScreen(),
          FavouriteScreen.routeName: (context) => FavouriteScreen(),
          CartScreen.routeName: (context) => CartScreen(),
        },
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) => HomeScreen());
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (context) => HomeScreen());
        },
      ),
    );
  }
}
