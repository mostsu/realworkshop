import 'package:flutter/material.dart';
import 'package:realworkshop/add_screen.dart';
import 'package:realworkshop/page_one.dart';
import 'package:realworkshop/users_screen.dart';
import 'add_member_screen.dart';
import 'login_screen.dart';
import 'main_screen.dart';
import 'home_screen.dart';
import 'package:realworkshop/utils/database_helper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'member_screen.dart';

void main() {
  DatabaseHelper databaseHelper = DatabaseHelper.internal();
  databaseHelper
      .initDatabase(); /*ไปเรียกใช้ initDatabase() ใน Class DatabaseHelper ที่อยู่ในไฟล์ database_helper.dart */
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //สร้าง DatePicker (มีวันที่ Pop up มาให้เลือก) ลองดู
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('th', 'TH'), // Thai
      ],
      ////สร้าง DatePicker

      debugShowCheckedModeBanner: false, //ซ่อนแถบ Debug ด้านขวาบนของหน้าจอ
      title: ("Real Workshop"),
      home: LoginScreen(),
      routes: <String, WidgetBuilder>{
        // '/add' คือ pushNamed ที่จะกำหนดเส้นทางว่าจะไปที่หน้าไหน
        '/home': (BuildContext context) => AddScreen('FUCKER'),
        '/detail': (BuildContext context) => PageOne(),
        '/usersScreen': (BuildContext context) => UsersScreen(),
        '/member': (BuildContext context) => MemberScreen(),
        '/add-member': (BuildContext context) => AddMemberScreen(),
      },
    );
  }
}
