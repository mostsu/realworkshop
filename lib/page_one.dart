import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Card(
              child: Image(image: AssetImage("assets/images/javapic.jpeg")),
            ),
            Card(
              child: Image(image: AssetImage("assets/images/weblang.jpeg")),
            ),
            SizedBox(height: 50,), //กำหนดระยะห่างของภาพ
            Card(
              child: Image(image: AssetImage("assets/images/debugger.jpeg")),
            ),
          ],
        ),
      ],
    );
  }
}
