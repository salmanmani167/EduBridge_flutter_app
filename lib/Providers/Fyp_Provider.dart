import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:sulaman_s_application007/Providers/Supervisor_Provider.dart';


class FypService with ChangeNotifier{


  String _project_title = "";

  //Team Lead
  String _first_name = "";
  String _last_name = "";
  String _department_name = "";
  String _emailid = "";
  String _personel_emailid = "";
  String _session = "";
  String _studentId = "";

  //Project Partener
  String _pp_first_name = "";
  String _pp_last_name = "";
  String _pp_department_name = "";
  String _pp_emailid = "";
  String _pp_personel_emailid = "";
  String _pp_session = "";
  String _pp_studentId = "";

  //
  String _message="";

  //FYP Details
  String _project_id = "";
  String _supervisor = "";






  String get getProjectTitle => _project_title;

//Team Lead
  String get getFirstName => _first_name;
  String get getLastName => _last_name;
  String get getDepartmentName => _department_name;
  String get getEmailId => _emailid;
  String get getPersonelEmailId => _personel_emailid;
  String get getSession => _session;
  String get getStudentId => _studentId;

  //Project Partener
  String get getPPFirstName => _pp_first_name;
  String get getPPLastName => _pp_last_name;
  String get getPPDepartmentName => _pp_department_name;
  String get getPPEmailId => _pp_emailid;
  String get getPPPersonelEmailId => _pp_personel_emailid;
  String get getPPSession => _pp_session;
  String get getPPStudentId => _pp_studentId;

  //FYP Details
  String get getFypProjectId => _project_id;
  String get getFypSupervisor => _supervisor;

  //
  String get getMessage => _message;




  void setProjectTitle(value){
    _project_title=value;
  }

  //Team Lead
  void setFirstName(value){
    _first_name=value;
  }

  void setLastName(value){
    _last_name=value;
  }

  void setDepartmentName(value){
    _department_name=value;
  }

  void setEmailId(value){
    _emailid=value;
  }

  void setPersonelEmailId(value){
    _personel_emailid=value;
  }

  void setSession(value){
    _session=value;
  }

  void setStudentId(value){
    _studentId=value;
  }

  //Project Partener

  void setPPFirstName(value){
    _pp_first_name=value;
  }

  void setPPLastName(value){
    _pp_last_name=value;
  }

  void setPPDepartmentName(value){
    _pp_department_name=value;
  }

  void setPPEmailId(value){
    _pp_emailid=value;
  }

  void setPPPersonelEmailId(value){
    _pp_personel_emailid=value;
  }

  void setPPSession(value){
    _pp_session=value;
  }

  void setPPStudentId(value){
    _pp_studentId=value;
  }

  //Fyp Details

  void setFypProjectId(value){
    _project_id=value;
  }
  void setFypSupervisor(value){
    print("test case :${value}");
    _supervisor=value;
  }

  void setMessage(value){_message=value;}

void FypCredentials(context) async{
    print("Fyp Credentials:"
        " ${getFirstName}"" ${getFirstName.runtimeType} +"
        " ${getLastName} ${getLastName.runtimeType} + "
        "${getEmailId} ${getEmailId.runtimeType} +"
        // " ${getFypSupervisor} ${getFypSupervisor.runtimeType} +"
        " ${getPersonelEmailId} ${getPersonelEmailId.runtimeType} "
        "${getProjectTitle}${getProjectTitle.runtimeType}"
        "${getDepartmentName}${getDepartmentName.runtimeType}""${getPPSession}""${getPPStudentId}"
        "");

  try {

    // final SuperVisorProvider = Provider.of<SupervisorService>(context,listen: false);

    // SuperVisorProvider.getSupervisorId
    Response response = await post(
        Uri.parse('http://10.0.2.2:8000/api/student/store'),
        body: {
           "project_title":_project_title.toString(),
          "first_name": _first_name.toString(),
          "last_name": _last_name.toString(),
           "email": _emailid.toString(),
           "email_uni":_personel_emailid.toString(),
          "sesstion":_session.toString(),
          "roll_num":_studentId.toString(),
          "department":_department_name.toString(),
//"first_name":"asli","last_name":"asli","email":"salmanmani167@gmail.com","email_uni":"asli@gmail.com",
          "superwiser_id": _supervisor.toString(),
           "project_id":_project_id.toString(),
//
            "colleague_first_name":_pp_first_name.toString(),
           "colleague_last_name":_pp_last_name.toString(),
           "colleague_email_uni":_pp_emailid.toString(),
          "colleague_email":_pp_personel_emailid.toString(),
          "colleague_sesstion":_pp_session.toString(),
          "colleague_roll_num":_pp_studentId.toString(),



        });
    var msg = jsonDecode(response.body.toString());
    // setMessage(msg);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      // print(data);
      print("DONEEEEEE");
      if (data["code"] == 200) {
        print("Fyp form");
        // print(data['message']);
        // success message
        // token in session
        print("Success");
      } else if (data["code"] == 422) {
        print("Error 422");
        // validation error
        if (data["error_type"] == "general") {
          print("Error General");
          // show message parameter
        } else if (data["error_type"] == "detailed") {
          print("Error detailed");
          // show validation_params_error parameter
        }
      } else {
        print(data["message"]);
        print("Something went wrong 1");
        // show something went wrong
      }
    } else {
      print(msg["message"]);
      print("Something went wrong 2");
      // show something went wrong server error
    }
  } catch (e) {
    print(getFypSupervisor.runtimeType);
    print(getFypSupervisor);
    print(getMessage);
    print(e);
    print("Something went wrong 3");
    // show something went wrong    String? auth_token = await getSessionData('auth_token');
  }
}

}