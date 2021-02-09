import 'package:api_calling/Modal/post.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class getApiTwo extends StatefulWidget {
  getApiTwo({Key key}) : super(key: key);

  @override
  _getApiTwoState createState() => _getApiTwoState();
}

class _getApiTwoState extends State<getApiTwo> {
  List data;
  List<Post> postData;
  bool check = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttpData();
  }

  getHttpData() async {
    var response = await http.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      final post = postFromJson(response.body.toString());
      setState(() {
        postData = post;
        check = true;
      });
      print("Reposne: ${postData[0]}");
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch API using Response"),
      ),
      body: !check
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10.0),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    color: Colors.indigoAccent,
                    height: 100,
                    width: 100,
                    child: Text('${postData[index].id}'),
                  ),
                );
              }),
    );
  }
}
