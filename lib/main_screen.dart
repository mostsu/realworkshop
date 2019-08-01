import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  //-------------------------------------
  String firstname = "Chaianan";
  String lastname = "Saetung";
  double weight = 70.0;
  double height = 167;
  double bmi = 0;

  //ตัวแปร Map ที่เป็นประเภท Object ลักษณะจะเป็น Key, Value
  Map greeting = {"TH": "สวัสดี", "JP": "Konnichiwa"};

  //Object Map ที่มี Key กับ Value เป็นคนละชนิดกัน
  Map<String, int> detail = {"age": 20, "height": 170};

  List sex = ["Male", "Female"];
  List<int> ages = [10, 20, 30];

  //List ที่มี Map ซ้อนอยู่ใน List
  List<Map<String, int>> myUsers = [
    {"age": 20, "height": 170},
    {"age": 25, "height": 177},
  ];
  //-------------------------------------

  void showDetail(String firstName, String lastName, int age){
    print("First Name : $firstName, Last Name : $lastName, Age : $age");
  }

  //-------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Real Workshop Flutter"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            print("$firstname $lastname");
            print("${1 + 15}");
            bmi = weight / ((height / 100) * (height / 100));
            print("BMI : $bmi");
            print("Show Detail : ");
            showDetail("Chaianan", "Saetung", 24);
          },
          color: Colors.red,
          child: Text(
            "Click for calculate BMI",
            style: TextStyle(color: Colors.yellowAccent),
          ),
        ),
      ),
    );
  }
}
