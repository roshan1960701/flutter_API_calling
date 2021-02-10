import 'package:flutter/material.dart';

class postApi extends StatefulWidget {
  postApi({Key key}) : super(key: key);

  @override
  _postApiState createState() => _postApiState();
}

class _postApiState extends State<postApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("POST API e.g. 1"),
      ),
    );
  }
}
