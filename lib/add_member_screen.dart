import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddMemberScreen extends StatefulWidget {
  @override
  _AddMemberScreenState createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {

  final _formKey = GlobalKey<FormState>(); //ใช้เพื่อ Validate Form กรอกข้อมูล

  DateTime birthDate;
  String strBirthDate;

  TextEditingController ctrlFirstName = TextEditingController();
  TextEditingController ctrlLastName = TextEditingController();
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlTelephone = TextEditingController();

  String sex = "ชาย";
  bool isActive = true;

  //---------------------------------------------------------------

  @override
  Widget build(BuildContext context) {

    DateTime _currentDate;
    int _year = DateTime.now().year;
    int _month = DateTime.now().month;
    int _day = DateTime.now().day;

    Future<Null> _showDatePicker() async {
      final DateTime picked = await showDatePicker(
          locale: const Locale("th"),
          context: context,
          initialDate: DateTime(_year, _month, _day), //วันที่เริ่มต้น
          firstDate: DateTime(1920, 1, 1),
          lastDate: DateTime(_year, _month, _day)); //ปีปัจจุบัน

      if (picked != null && picked != _currentDate) {
        setState(() {
          //Format English
          /*     var formatter = new DateFormat(
              'dd-MMM-yyyy'); //DateFormat จะต้อง import 'package:intl/intl.dart'; ด้วย
          String formatted = formatter.format(picked);
          strBirthDate = formatted;*/

          //Format ภาษาไทย
          var strDate = DateFormat.MMMMd("th_TH")
              .format(DateTime(picked.year, picked.month, picked.day));
          strBirthDate = "$strDate ${picked.year + 543}";
          birthDate = picked;
        });
      }
    }

    Future<Null> saveData() async {
      print(ctrlFirstName.text);
      print(ctrlLastName.text);
      print(ctrlEmail.text);
      print(ctrlTelephone.text);
      print(sex);
      print(birthDate);
      print(isActive);

      if (_formKey.currentState.validate()) {
        //ใช้เพื่อ Validate Form กรอกข้อมูล
        print("Save Data !!");
      } else {
        print("Fail !!");
      }
    }

    String _validateEmail(String value) { //Check Validate เฉพาะ Email
      if (value.isEmpty) return 'กรุณาระบุอีเมล์';
      final RegExp nameExp = new RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
      if (!nameExp.hasMatch(value)) return 'กรุณาระบุให้ถูกรูปแบบ';
      return null;
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Add NewMember"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                saveData();
              })
        ],
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, //ใส่เพื่อให้ข้อความชิดซ้าย
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "รายละเอียดสมาชิก",
                    style: Theme.of(context).textTheme.title,
                    /* style: Theme.of(context).textTheme.body1,
                    style: Theme.of(context).textTheme.body2, ดูรายละเอียดได้โดย Search "Flutter Typography"
                    style: Theme.of(context).textTheme.display1,
                     style: Theme.of(context).textTheme.อะไรก็แล้วแต่,*/
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey, //ใช้เพื่อ Validate Form กรอกข้อมูล
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: "First Name",
                                  labelStyle: TextStyle(
                                      fontSize: 20.0), //ปรับขนาด LabelText
                                ),
                                controller: ctrlFirstName,
                                validator: (String value) {
                                  //ใช้เพื่อ Validate Form กรอกข้อมูล
                                  if (value.isEmpty) {
                                    return "กรุณาระบุชื่อ";
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ), //เพิ่มช่องเว้นวรรคระหว่างช่องกรอกข้อมูล 2 ฟิลด์
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Last Name",
                                  labelStyle: TextStyle(
                                      fontSize: 20.0), //ปรับขนาด LabelText
                                ),
                                controller: ctrlLastName,
                                validator: (String value){
                                  if(value.isEmpty){
                                    return 'กรุณาระบุนามสกุล';
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Birth date",
                              style: TextStyle(fontSize: 20),
                            ),
                            FlatButton(
                                onPressed: () => _showDatePicker(),
                                child: Text(
                                  strBirthDate ?? "เลือกวันที่",
                                  style: TextStyle(fontSize: 20),
                                ))
                          ],
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email Address",
                            labelStyle:
                                TextStyle(fontSize: 20.0), //ปรับขนาด LabelText
                          ),
                          controller: ctrlEmail,
                          validator: _validateEmail,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: "Telephone number",
                            labelStyle:
                                TextStyle(fontSize: 20.0), //ปรับขนาด LabelText
                          ),
                          controller: ctrlTelephone,
                          validator: (String value) {
                            //ใช้เพื่อ Validate Form กรอกข้อมูล
                            if (value.isEmpty) {
                              return "กรุณาระบุเบอร์โทรฯ";
                            }
                          },
                        ),
                        SwitchListTile(
                          value: true,
                          onChanged: (bool value) {
                            setState(() {
                              isActive = value;
                            });
                          },
                          title: Text("เปิดการใช้งานระบบ !!"),
                        ),
                        ListTile(
                          //Selector เริ่มตรงนี้
                          title: Text(
                            "เพศ",
                            style: TextStyle(fontSize: 20),
                          ),
                          trailing: DropdownButton<String>(
                            value: sex,
                            style: TextStyle(fontSize: 20, color: Colors.black),
                            onChanged: (String newValue) {
                              setState(() {
                                sex = newValue;
                              });
                            },
                            items: <String>["ชาย", "หญิง"].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Container(
                                  child: Text(value),
                                  width: 120,
                                ), //ถ้าใส่ Container จะทำให้เพิ่มความกว้าง-ยาว ได้
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
