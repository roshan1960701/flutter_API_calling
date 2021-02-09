import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class gridViewApi extends StatefulWidget {
  gridViewApi({Key key}) : super(key: key);

  @override
  _gridViewApiState createState() => _gridViewApiState();
}

class _gridViewApiState extends State<gridViewApi> {
  List data;
  bool check = false;
  List cityNames = ["Mumbai", "Delhi", "Chennai", "Kolakatta", "Pune"];
  List Numbers = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    0,
    11,
    12,
    1,
    3,
    422,
    32,
    235,
    241,
    12,
    124
  ];
  double listHeight;
  @override
  void initState() {
    // TODO: implement initState
    getHttpData();
    getCityData();
    super.initState();
  }

  getCityHeight(int lenght) async {
    double no = lenght.toDouble();
    if (lenght.isEven) {
      no = no - 1;
      return no * 200;
    } else {
      no = no - 2;
      return no * 200;
    }
  }

  getCityData() async {
    for (int i = 1; i <= cityNames.length; i++) {}
  }

  getHttpData() async {
    var response = await http.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body.toString());

      setState(() {
        data = jsonResponse;
        check = true;
      });
      // print("Reposne: $jsonResponse");
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Widget insertRowData(int index) {
    return Row(
      mainAxisAlignment: index.isOdd
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 200,
          width: 200,
          color: Colors.red,
          child: Text('$index'),
        )
      ],
    );
  }

  Widget insertData() {
    return Container(
      height: 1000,
      child: ListView.builder(
        itemCount: cityNames.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            child: insertRowData(index),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      scrollDirection: Axis.vertical,
      children: [
        insertData(),
        Card(
          child: Text("1"),
        ),
        Card(
          child: Text("2"),
        ),
        Card(
          child: Text("3"),
        ),
        Card(
          child: Text("4"),
        ),
        Card(
          child: Text("5"),
        ),
        Card(
          child: Text("6"),
        ),
        Card(
          child: Text("7"),
        ),
        Card(
          child: Text("7"),
        ),
        Card(
          child: Text("7"),
        ),
        Card(
          child: Text("7"),
        ),
        Card(
          child: Text("7"),
        ),
        Card(
          child: Text("7"),
        ),
        Card(
          child: Text("7"),
        ),
        Card(
          child: Text("7"),
        ),
        Card(
          child: Text("7"),
        ),
      ],
    ));
  }
}
