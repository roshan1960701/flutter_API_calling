import 'package:api_calling/Modal/user.dart';
import 'package:bd_progress_bar/bdprogreebar.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class getApiTwoUser extends StatefulWidget {
  getApiTwoUser({Key key}) : super(key: key);

  @override
  _getApiTwoUserState createState() => _getApiTwoUserState();
}

class _getApiTwoUserState extends State<getApiTwoUser> {
  List<User> userData;
  bool check = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttpData();
  }

  getHttpData() async {
    var response = await http.get('http://jsonplaceholder.typicode.com/users');
    if (response.statusCode == 200) {
      final user = userFromJson(response.body.toString());
      setState(() {
        userData = user;
        check = true;
      });
      print("Reposne: ${userData[0]}");
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Response fetch from API"),
      ),
      body: !check
          ? Center(
              child: Loader4(),
            )
          : ListView.builder(
              itemCount: userData.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.greenAccent,
                  elevation: 10.0,
                  child: Column(
                    children: [
                      Text("Id: ${userData[index].id}"),
                      Text("Name: ${userData[index].name}"),
                      Text("UserName: ${userData[index].username}"),
                      Text("Email: ${userData[index].email}"),
                      Text("City: ${userData[index].address.city}"),
                      Text("phone: ${userData[index].phone}"),
                      Text("company: ${userData[index].company.name}"),
                    ],
                  ),
                );
              }),
    );
  }
}
