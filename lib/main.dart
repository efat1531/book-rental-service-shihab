// ignore_for_file: prefer_const_constructors

import 'package:provider/provider.dart';

import './screens/home_screen.dart';
import 'package:flutter/material.dart';
import './providers/book_list_provider.dart';
import './screens/book_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: HomeScreen(),
        initialRoute: '/home',
        routes: {
          '/home': (context) => HomeScreen(),
          BookDetailScreen.routeName: (context) => BookDetailScreen(),
        },
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) => BookDetailScreen());
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (context) => BookDetailScreen());
        },
      ),
    );
  }
}
