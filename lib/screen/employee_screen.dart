import 'package:flutter/material.dart';
import 'package:todoapi/service/employee_service.dart';

import '../Model/employee.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee data"),
        actions: [
          IconButton(onPressed: (){
           print(EmployeeSevice().getalldata());
          }, icon: Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder(future: EmployeeSevice().getalldata(), builder: (context,snapshot){
        if(snapshot.hasError){
          return Center(child: Text('error fetching employee data'),);
        }
        if(snapshot.hasData){
          var data=snapshot.data as List<Employee>;
          return ListView.builder(
              itemCount: data.length,
              itemBuilder:(context,index){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data[index].avatar!),
                  ),
                  title: Text("${data[index].firstName}${data[index].lastName}"),
                  subtitle: Text(data[index].email!),

                );

              });

        }
        else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }


      }),
    );
  }
}
