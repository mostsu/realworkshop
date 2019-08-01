import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userControl = TextEditingController();
  TextEditingController passControl = TextEditingController();

  void doLogin() {
    print(userControl.text);
    print(passControl.text);

    if (userControl.text == "admin" && passControl.text == "1234") {
      Navigator.pushReplacement(  //pushReplacement จะทำให้เวลา Log in แล้ว ไม่สามารถ Back กลับมายังหน้า Log in ได้อีก
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.red,
          ),
          ListView(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                        width: 150,
                        height: 150,
                        image: AssetImage('assets/images/dartBirdLogo.png')),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Form(
                          child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: userControl,
                            style: TextStyle(fontSize: 20),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              labelText: "กรอก Email",
                              filled: true,
                              fillColor: Colors.white70,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: passControl,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "กรอก Passowrd (Hint Text)",
                              prefixIcon: Icon(
                                Icons.vpn_key,
                                color: Colors.black,
                              ),
                              // labelText: "กรอก Password",
                              filled: true, fillColor: Colors.white70,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          _loginButton(),
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: <Widget>[
                            Expanded(
                                child: Divider(
                              color: Colors.black,
                            )),
                            Text(" OR "),
                            Expanded(
                                child: Divider(
                              color: Colors.black,
                            )),
                          ]),
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              "สมัครสมาชิก (Sign up)",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlueAccent),
                            ),
                          ),
                        ],
                      )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Material _loginButton() {
    return Material(
      //borderRadius: BorderRadius.circular(25.0),
      shadowColor: Colors.blueAccent[400],
      elevation: 5.0,
      child: MaterialButton(
        onPressed: () {
          doLogin();
        },
        minWidth: 290.0,
        height: 55.0,
        color: Colors.blueAccent,
        child: Text(
          "Log in",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 0.3),
        ),
      ),
    );
  }
}

//----------------------------------------------
Row set1() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      RaisedButton.icon(
        onPressed: () {},
        icon: Icon(Icons.arrow_right),
        label: Text("Log in"),
        color: Colors.blueAccent,
      ),
      RaisedButton.icon(
        onPressed: () {},
        icon: Icon(Icons.sentiment_very_dissatisfied),
        label: Text("ลืม Password"),
        color: Colors.blueAccent,
      ),
    ],
  );
}

//----------------------------------------------

