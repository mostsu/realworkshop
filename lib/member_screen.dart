import 'package:flutter/material.dart';

class MemberScreen extends StatefulWidget {
  @override
  _MemberScreenState createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Members"),
      ),
      body: ListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/add-member"); //เมื่อกดปุ่มแล้วให้เปลี่ยนไปยังหน้า add_member_screen
        },
        child: Icon(Icons.person_add),
      ),
    );
  }
}
