import 'dart:io';
import 'package:flutter/material.dart';
import 'package:realworkshop/add_screen.dart';
import 'package:realworkshop/users_screen.dart';
import 'page_one.dart';
import 'page_two.dart';
import 'page_three.dart';

int _currentIndex = 0;
List pages = [PageOne(), PageTwo(), PageThree()];
bool hasImage = true;

//-----------------------------------------------

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//-----------------------------------------------

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //-------------------------------------------------------------------
    //สร้าง Widget ที่เป็น AppBar แยกออกมาเป็น Method
    Widget appBar = AppBar(
      title: Text("Home Screen"),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.home),
            onPressed: () => {
                  Navigator.of(context).pushNamed("/home"),
                }),
        IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.of(context).pushNamed("/detail");
            }),
      ],
    );
    //-------------------------------------------------------------------

    //-------------------------------------------------------------------
    //ต้องย้าย Method เข้ามาอยู่ใน Widget build เพราะว่ามันต้องใช้ object "context"
    Widget floatingAction = FloatingActionButton(
      onPressed: () async {
        //มี async แต่ไม่มี await ก็ได้ แต่ถ้ามี await จะต้องมี async (ใช้เพื่อรับค่ากลับมาจาก class อื่นๆ)
        var response = await Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddScreen("Chai")));

        if (response != null) {
          print(response["ID"] ?? "null"); //short if
        }
      },
      child: Icon(Icons.add),
    );
    //-------------------------------------------------------------------

    //-------------------------------------------------------------------
    //BottomNavigationBar ต้องสร้างให้อยู่ภายใน Widget build
    Widget bottomNavBar = BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          //  _currentIndex = index; //ถ้าใส่คำสั่งนี้นอก setState ค่าของตัวแปร Local เท่านั้นที่เปลี่ยนไป แต่ Global ไม่เปลี่ยน
          setState(() {
            _currentIndex =
                index; //ใส่คำสั่งนี้อยู่ภายใต้ setState จะทำให้ค่าของตัวแปร Global เปลี่ยนตาม
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text("หน้าหลัก")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("ข้อมูลส่วนตัว")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("ตั้งค่า")),
        ]);
    //-------------------------------------------------------------------

    //-------------------------------------------------------------------
    Widget _drawer = Drawer(
      child: ListView(
        padding: EdgeInsets.only(),
        children: <Widget>[
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      //  fit: BoxFit.fill, //ให้ภาพมันเต็มช่อง BoxDecoration
                      image: AssetImage("assets/images/android.jpg"))),
              currentAccountPicture:
                  hasImage //ใช้ Short if ในการเช็คว่า ถ้ามีภาพอยู่จริง ให้ใช้อันแรก มิเช่นนั้นจะให้ใช้เป็นอักษรย่อ
                      ? CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/debugger.jpeg"),
                          // NetworkImage( 'https://randomuser.me/api/portraits/med/men/87.jpg'), //โหลดภาพจาก network
                        )
                      : CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Text(
                            "C",
                            style: TextStyle(color: Colors.red, fontSize: 50),
                          )),
              accountName: Text(
                "Chaianan",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text("mostsu@gmail.com")),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'หน้าหลัก',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("หน้าแรกอะ"),
            //   trailing: Icon(Icons.play_arrow),
            onTap: () {},
          ),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(
              'ข้อมูลส่วนตัว',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(""),
            //   trailing: Icon(Icons.play_arrow),
            onTap: () {

            },
          ),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text(
              'User Screen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("ผู้ใช้งาน"),
            //   trailing: Icon(Icons.play_arrow),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/usersScreen");
            },
          ),ListTile(
            leading: Icon(Icons.group),
            title: Text(
              'สมาชิก (Member)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("สมาชิก"),
            //   trailing: Icon(Icons.play_arrow),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/member");
            },
          ),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'ตั้งค่า',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(""),
            //   trailing: Icon(Icons.play_arrow),
            onTap: () {},
          ),
          Divider(
            height: 10,
            color: Colors.lightBlueAccent,
          ),
          ListTile(
            title: Text(
              'ออกจากระบบ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            trailing: Icon(Icons.exit_to_app),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );
    //-------------------------------------------------------------------

    return Scaffold(
      drawer: _drawer,
      appBar: appBar,
      body: pages[_currentIndex],
      floatingActionButton: floatingAction,
      bottomNavigationBar: bottomNavBar,
    );
  }
}
