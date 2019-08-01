import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  var params; // 1.การส่งค่าทาง Parameter ระหว่าง Class จะต้องสร้าง Attributes ของ class

  AddScreen(this.params); // 2.สร้าง Constructor ขึ้นมาด้วย

  @override
  _AddScreenState createState() =>
      _AddScreenState(params); //3.ใส่ชื่อ attributes ที่นี่ด้วย
}

class _AddScreenState extends State<AddScreen> {
  var params; //4.สร้าง Parameter เหมือนกับ class AddScreen

  _AddScreenState(
      this.params); //5.สร้าง Parameter เหมือนกับ Class AddScreen เช่นเดียวกัน

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Screen Display "),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Text("Hello : $params"),
          ),
          RaisedButton(
            color: Colors.red,
            onPressed: () {
              //กรณีต้องการกดปุ่มเพื่อ Back กลับไปยังหน้าก่อนหน้านี้ และส่งค่ากลับ (ภายใน pop())
              Navigator.of(context).pop({"ID" : null});
            },
            child: Text("Back"),
          )
        ],
      ),
    );
  }
}
