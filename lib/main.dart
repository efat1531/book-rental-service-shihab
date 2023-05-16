import 'package:provider/provider.dart';

import './screens/home_screen.dart';
import 'package:flutter/material.dart';
import './providers/book_list_provider.dart';

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
      child: const MaterialApp(
        debugShowCheckedModeBanner:  false,
        title: 'Flutter Demo',
        home: HomeScreen(),
      ),
    );
  }
}
