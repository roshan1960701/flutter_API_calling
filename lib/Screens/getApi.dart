import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class getAPi extends StatefulWidget {
  getAPi({Key key}) : super(key: key);

  @override
  _getAPiState createState() => _getAPiState();
}

class _getAPiState extends State<getAPi> {
  List data;
  bool check = false;

  @override
  void initState() {
    // TODO: implement initState
    getHttpData();
    super.initState();
  }

  getHttpData() async {
    var response = await http.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body.toString());

      setState(() {
        data = jsonResponse;
        check = true;
      });
      print("Reposne: $jsonResponse");
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get API 1'),
      ),
      body: check
          ? ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Text(
                        "Title: ${data[index]['title']}",
                        style: TextStyle(),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Id: ${data[index]['id']}",
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                );
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
