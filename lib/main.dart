import 'package:country_api/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        bottomAppBarColor: Colors.green,
        appBarTheme: AppBarTheme(
          color: Colors.green,
          centerTitle: true,
        ),
      ),
      home: HomePage(),
    );
  }
}
