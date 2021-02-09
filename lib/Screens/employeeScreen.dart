import 'package:api_calling/Modal/Employee.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class employeeScreen extends StatefulWidget {
  employeeScreen({Key key}) : super(key: key);

  @override
  _employeeScreenState createState() => _employeeScreenState();
}

class _employeeScreenState extends State<employeeScreen> {
  List<Datum> empData;
  bool check = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttpData();
  }

  getHttpData() async {
    var response =
        await http.get('http://dummy.restapiexample.com/api/v1/employees');
    if (response.statusCode == 200) {
      final employee = employeeFromJson(response.body.toString());

      setState(() {
        empData = employee.data;
        check = true;
      });
      print("Reposne: ${empData[0]}");
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee API"),
      ),
      body: !check
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
              ),
            )
          : ListView.builder(
              itemCount: empData.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.orange,
                  elevation: 10.0,
                  child: Column(
                    children: [
                      Text("Id: ${empData[index].id}"),
                      Text("employee_name: ${empData[index].employeeName}"),
                      Text("employee_salary: ${empData[index].employeeSalary}"),
                      Text("employee_age: ${empData[index].employeeAge}"),
                    ],
                  ),
                );
              }),
    );
  }
}
