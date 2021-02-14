import 'package:api_calling/Modal/GetCategory.dart';
import 'package:bd_progress_bar/bdprogreebar.dart';
import 'package:flutter/material.dart';
import 'package:api_calling/Services/post_service_request.dart';

class fetchPost extends StatefulWidget {
  fetchPost({Key key}) : super(key: key);

  @override
  _fetchPostState createState() => _fetchPostState();
}

class _fetchPostState extends State<fetchPost> {
  GetCategoryResponse _categoryResponse;
  List<Categorycontent> contentData;
  int ResponseCode = 0;

  @override
  void initState() {
    // TODO: implement initState

    //fetchPost();
    getContentData();
    super.initState();
  }

  getContentData() async {
    var response = await getContent("c88d1385-7fe3-11ea-85d6-0a10ec74f454");
    final getCategoryResponse =
        getCategoryResponseFromJson(response.body.toString());
    setState(() {
      contentData = getCategoryResponse.categorycontent;
      print("Resp: ${contentData[0].name}");
    });
  }

  fetchPost() async {
    await getContent("c88d1385-7fe3-11ea-85d6-0a10ec74f454").then((response) {
      print("Response: ${response.statusCode}");
      setState(() {
        print("Response: ${response.statusCode}");

        // if (response != null) {
        //   print("Hello");
        //   final getCategoryResponse =
        //       getCategoryResponseFromJson(response.body.toString());
        //   content = getCategoryResponse.categorycontent;
        //   print("Resp: ${content[0].name}");
        //   ResponseCode = 1;
        // }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post API"),
      ),
      // body: ResponseCode == 0
      //     ? Center(
      //         child: Loader2(),
      //       )
      //     : Text("Resp: ${content[0].name}"),
    );
  }
}
