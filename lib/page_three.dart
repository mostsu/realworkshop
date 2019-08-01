import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "เมนูตั้งค่าการใช้งาน",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/debugger.jpeg"),
                ),
                title: Text("Account"),
                subtitle: Text("ข้อมูลผู้ใช้"),
                trailing: Icon(Icons.play_arrow),
              ),
            ],
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.vpn_key),
            title: Text("Change Password"),
            subtitle: Text("เปลี่ยนรหัสผ่าน"),
            trailing: Icon(Icons.play_arrow),
          ),
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "ตั้งค่าทั่วๆไป",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/debugger.jpeg"),
                ),
                title: Text("Title 1"),
                subtitle: Text("Subtitle 1"),
                trailing: Icon(Icons.play_arrow),
              ),
            ],
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.vpn_key),
            title: Text("Change Password"),
            subtitle: Text("เปลี่ยนรหัสผ่าน"),
            trailing: Icon(Icons.play_arrow),
          ),
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "อื่นๆ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/debugger.jpeg"),
                ),
                title: Text("Account"),
                subtitle: Text("ข้อมูลผู้ใช้"),
                trailing: Icon(Icons.play_arrow),
              ),
            ],
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.vpn_key),
            title: Text("Change Password"),
            subtitle: Text("เปลี่ยนรหัสผ่าน"),
            trailing: Icon(Icons.play_arrow),
          ),
        ),
      ],
    );
  }
}
