import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  var users;
  bool isLoading = true;

  Future<Null> getUsers() async {
    final response = await http.get('https://randomuser.me/api/?results=15');
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      //  print(jsonResponse);

      //Function Apply Data ให้กับตัวแปร เมื่อมีการเปลี่ยนแปลงข้อมูล
      setState(() {
        isLoading = false;
        users = jsonResponse[
            'results']; //results เป็น Object ที่มาจาก randomuser.me
      });
    } else {
      print("Connected error !");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("User Lists"),
        ),
        body: Card(
          child: RefreshIndicator(
            onRefresh: getUsers,
            child: isLoading ? Center(
              child: CircularProgressIndicator(),
            ) : ListView.builder(
              itemBuilder: (context, int index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(backgroundImage: NetworkImage(users[index]['picture']['medium']),),
                      title: Text(
                        '${users[index]['name']['first']} ${users[index]['name']['last']}',
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text('${users[index]['email']}'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    Divider(color: Colors.red, height: 20,),
                  ],
                );
              },
              itemCount: users != null ? users.length : 0,
              /*users เป็นประเภท var ก็เลยใช้ null
                      ความหมายคือ เขียน short if ให้เช็คว่า ข้อมูลที่ดึงมา ไม่ใช่ null ใช่ไหม ?
                      ถ้าใช่ ก็ให้ users.length เพื่อสร้างจำนวนข้อมูลขึ้นมา
                      มิเช่นนั้น ก็ให้เป็น 0 คือไม่ต้องสร้างอะไรเลย*/
            ),
          ),
        ),
        );
  }
}

//----------------------ล่าสุด---------------------------------

//import 'dart:async';
//import 'dart:convert';
//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//
//
//Future<Post> fetchPost() async {
//  final response =
//  await http.get('https://jsonplaceholder.typicode.com/posts/1');
//
//  if (response.statusCode == 200) {
//    // If the call to the server was successful, parse the JSON.
//    return Post.fromJson(json.decode(response.body));
//  } else {
//    // If that call was not successful, throw an error.
//    throw Exception('Failed to load post');
//  }
//}
//
//class Post {
//  final int userId;
//  final int id;
//  final String title;
//  final String body;
//
//  Post({this.userId, this.id, this.title, this.body});
//
//  factory Post.fromJson(Map<String, dynamic> json) {
//    return Post(
//      userId: json['userId'],
//      id: json['id'],
//      title: json['title'],
//      body: json['body'],
//    );
//  }
//}
//
//class UsersScreen extends StatelessWidget {
//  final Future<Post> post;
//
//  UsersScreen({Key key, this.post}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Fetch Data Example',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Fetch Data Example'),
//        ),
//        body: Center(
//          child: FutureBuilder<Post>(
//            future: post,
//            builder: (context, snapshot) {
//              if (snapshot.hasData) {
//                return Text(snapshot.data.title);
//              } else if (snapshot.hasError) {
//                return Text("${snapshot.error}");
//              }
//
//              // By default, show a loading spinner.
//              return CircularProgressIndicator();
//            },
//          ),
//        ),
//      ),
//    );
//  }
//}
//----------------------ล่าสุด---------------------------------

//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'dart:async';
//import 'dart:convert'; //แปลง JSON ให้เป็น Object
//
//class UsersScreen extends StatefulWidget {
//  @override
//  _UsersScreenState createState() => _UsersScreenState();
//}
//
//class _UsersScreenState extends State<UsersScreen> {
//
//  final String url = "https://jsonplaceholder.typicode.com/posts/1";
//  List data;
//
//  @override
//  void initState() {
//    super.initState();
//    this.getJsonData();
//  }
//
//  Future<String> getJsonData() async{
//    var response = await http.get(
//      //Encode the url
//        Uri.encodeFull(url),
//      //Only accept json response
//      headers: {"Accept": "application/json"});
//
//      print(response.body);
//
//      setState(() {
//        var convertDataToJson = json.decode(response.body);
//        data = convertDataToJson['result'];
//      });
//
//      return "Success";
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: ("UsersScreen"),
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text("Users Screen"),
//        ),
//        body: ListView.builder(
//          itemCount: data == null ? 0 : data.length,
//          itemBuilder: (BuildContext context, int index) {
//            return Container(
//              child: Center(
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.stretch,
//                  children: <Widget>[
//                    Card(
//                      child: Container(
//                          child: Text(data[index]['name']), padding: EdgeInsets.all(20.0)),
//                    ),
//                  ],
//                ),
//              ),
//            );
//          },
//        ),
//      ),
//    );
//  }
//}

//----------------------------------------------

//
//class UsersScreen extends StatefulWidget {
//  @override
//  _UsersScreenState createState() => _UsersScreenState();
//}
//
//class _UsersScreenState extends State<UsersScreen> {
//
//  Future<Post> fetchPost() async {
//    final response =
//    await http.get('https://jsonplaceholder.typicode.com/posts/1');
//
//    if (response.statusCode == 200) {
//      // If server returns an OK response, parse the JSON.
//      return Post.fromJson(json.decode(response.body));
//    } else {
//      // If that response was not OK, throw an error.
//      throw Exception('Failed to load post');
//    }
//  }
//
//  //-----------------------------------------------
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: "Users Screen",
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text("Users Screen"),
//        ),
//        body: ListView.builder(
//          //ListView.builder จะช่วย Generate สร้าง ListTile ตามจำนวนที่เราต้องการ
//          itemBuilder: (context, int index) {
//            return Card(
//              child: ListTile(
//                onTap: () {},
//                title: Text(
//                  "ListTile",
//                  style: TextStyle(fontSize: 20),
//                ),
//                subtitle: Text("HEY"),
//                trailing: Icon(Icons.android),
//              ),
//            );
//          },
//          itemCount: 10,
//        ),
//      ),
//    );
//  }
//}
//
//class Post {
//  final int userId;
//  final int id;
//  final String title;
//  final String body;
//
//  Post({this.userId, this.id, this.title, this.body});
//
//  factory Post.fromJson(Map<String, dynamic> json) {
//    return Post(
//      userId: json['userId'],
//      id: json['id'],
//      title: json['title'],
//      body: json['body'],
//    );
//  }
//}
