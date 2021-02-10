import 'package:api_calling/Screens/employeeScreen.dart';
import 'package:api_calling/Screens/getApi.dart';
import 'package:api_calling/Screens/getApiTwo.dart';
import 'package:api_calling/Screens/getApiTwoUser.dart';
import 'package:api_calling/Screens/gridViewApi.dart';
import 'package:api_calling/Screens/postApi.dart';
import 'package:api_calling/Screens/unsplashScreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: () async {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => getAPi()));
              },
              color: Colors.orangeAccent,
              minWidth: 120,
              height: 40,
              elevation: 10.0,
              child: Text("Get API"),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => gridViewApi()));
              },
              color: Colors.orangeAccent,
              minWidth: 120,
              height: 40,
              elevation: 10.0,
              child: Text("Get API in Manual GridView"),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => getApiTwo()));
              },
              color: Colors.orangeAccent,
              minWidth: 120,
              height: 40,
              elevation: 10.0,
              child: Text("Get API from response"),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => getApiTwoUser()));
              },
              color: Colors.orangeAccent,
              minWidth: 120,
              height: 40,
              elevation: 10.0,
              child: Text("Get API from Response User"),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => employeeScreen()));
              },
              color: Colors.orangeAccent,
              minWidth: 120,
              height: 40,
              elevation: 10.0,
              child: Text("Get API from Response Employee"),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => unsplashScreen()));
              },
              color: Colors.orangeAccent,
              minWidth: 120,
              height: 40,
              elevation: 10.0,
              child: Text("Unsplash"),
            ),
          ],
        ),
      ),
    );
  }
}
