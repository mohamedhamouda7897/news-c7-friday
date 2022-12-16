import 'package:flutter/material.dart';
import 'package:news_c7_fri/layout/home_layout.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeLayout.routeName,
      routes:{
        HomeLayout.routeName:(context) => HomeLayout()
      } ,
      debugShowCheckedModeBanner: false,
    );
  }
}

