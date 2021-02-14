import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  ListViewScreen({Key key}) : super(key: key);

  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Widget> data = [];
  List<Widget> content = [];
  List names = ['Mumbai', 'Delhi', 'Kolkatta', 'Hydrabad', 'Jaipur', 'chennai'];

  dataList() async {
    for (int i = 0; i < names.length; i++) {
      data.add(setData(names[i]));
    }
  }

  Widget setData(var nameData) {
    return Card(
      color: Colors.orangeAccent,
      elevation: 10.0,
      child: Text('$nameData'),
    );
  }

  List<Widget> _buildUserGroups() {
    var userGroup = List<Widget>();
    userGroup.add(Text("Users"));

    for (var i = 0; i < names.length; i++) {
      // userGroup.add(Text("User " + i.toString()));

    }

    return userGroup;
  }

  @override
  void initState() {
    // TODO: implement initState
    dataList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: ListView(
          scrollDirection: Axis.vertical, shrinkWrap: true, children: data),
    );
  }
}
