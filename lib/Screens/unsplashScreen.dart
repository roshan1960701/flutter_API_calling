import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:api_calling/Modal/Unsplash.dart';
import 'package:bd_progress_bar/bdprogreebar.dart';
import 'package:bd_progress_bar/loaders/color_loader.dart';
import 'package:bd_progress_bar/loaders/color_loader_2.dart';
import 'package:bd_progress_bar/loaders/color_loader_3.dart';
import 'package:bd_progress_bar/loaders/color_loader_4.dart';
import 'package:bd_progress_bar/loaders/color_loader_5.dart';
import 'package:bd_progress_bar/loaders/color_loader_6.dart';
import 'package:bd_progress_bar/loaders/color_loader_7.dart';
import 'package:bd_progress_bar/loaders/dot_type.dart';
import 'package:bd_progress_bar/loaders/flip_loader.dart';

class unsplashScreen extends StatefulWidget {
  unsplashScreen({Key key}) : super(key: key);

  @override
  _unsplashScreenState createState() => _unsplashScreenState();
}

class _unsplashScreenState extends State<unsplashScreen> {
  List<Result> unsplashData;
  bool check = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttpData();
  }

  getHttpData() async {
    var response = await http.get(
        'https://api.unsplash.com/search/photos/?query=wanderlust&client_id=kxaFKTEZqobwoiljrDhC4yBJwUxTsXfPFCJKhGRNHhk');
    if (response.statusCode == 200) {
      final unsplash = unsplashFromJson(response.body.toString());

      setState(() {
        unsplashData = unsplash.results;
        check = true;
      });
      print("Reposne: ${unsplashData[0]}");
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Unslash"),
        ),
        body: !check
            ? Center(child: Loader6())
            : GridView.builder(
                itemCount: unsplashData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 10.0),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(10))),
                    child: Image.network(
                      '${unsplashData[index].urls.regular}',
                      fit: BoxFit.cover,
                    ),
                  );
                }));
  }
}
