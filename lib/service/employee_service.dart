import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:todoapi/Model/employee.dart';

class EmployeeSevice{
  List<Employee>allEmployee=[];
  String baseurl="https://reqres.in/api/";
  getalldata()async{
    try{
      var response=await http.get(Uri.parse(baseurl+'users?page=2'));
      if(response.statusCode==200){
        var data= response.body;
        var decoeData=jsonDecode(data);
        var employees=decoeData['data'];
        //print(employees);
        for(var employee in employees){
          Employee newEmployee=Employee.fromJson(employee);
          allEmployee.add(newEmployee);
        }
        print(allEmployee);
        return allEmployee;

      }
    }catch(e){
      throw Exception(e.toString());

    }

  }

}