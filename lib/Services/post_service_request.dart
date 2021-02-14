import 'package:api_calling/Modal/GetCategory.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

//String url = 'https://thelittlepeople.co/controller/API_controller.php';
String url = 'http://heycloudy.co/controller/API_controller.php';
Future<http.Response> getContent(String userid) async {
  //TODO://new API ADDED
  GetCategoryRequest req = GetCategoryRequest(
      action: /*"GetContentv2"*/ "GetHomeContent", userid: userid);

  http.Response response;
  try {
    response = await http.post('$url',
        headers: {"Access-Control-Allow-Origin: *"},
        body: getCategoryRequestToJson(req));
  } on SocketException catch (_) {}

  return response;

  //LogPrint(response.body);
  // print(response.statusCode);
}
