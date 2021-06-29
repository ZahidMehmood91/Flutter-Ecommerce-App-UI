import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 60,
              centerTitle: true,
              title: Text(
                "Ecom App UI",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {},
                  color: Colors.black,
                  iconSize: 25,
                )
              ],
            ),
            body: Ecomm()));
  }
}
