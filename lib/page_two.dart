import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          color: Colors.red,
        ),
        Container(
          height: 100,
          color: Colors.green,
        ),
        Container(

          height: 100,
          color: Colors.blue,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 100,
                color: Colors.red,
              ),
            ),
            Expanded(
              child: Container(
                height: 150,
                color: Colors.green,
              ),
            ),
            Expanded(
              child: Container(
                height: 200,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
