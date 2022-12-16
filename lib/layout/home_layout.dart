import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName='HOme';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
    );
  }
}
