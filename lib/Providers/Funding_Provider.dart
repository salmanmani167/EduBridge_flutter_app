import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FundingService with ChangeNotifier{
  //Supervisor

  String _supervisor_id = "";
  String _supervisor_email_id="";
  String _personal_Supervisor_email_id = "";
  String _supervisor_address = "";
  String _supervisor_city = "";
  String _supervisor_state="";
  String _supervisor_country="";

  //Team Lead
  String _student_name="";
  String _student_id ="";
  String _father_name="";
  String _student_email_id="";
  String _student_roll_num="";
  String _student_address = "";
  String _student_city = "";
  String _student_state = "";
  String _student_postal_code="";
  String _amount = "";



  String get getSupervisorId => _supervisor_id;
  String get getSupervisorEmailId => _supervisor_email_id;
  String get getSupervisorPersonalEmailId => _personal_Supervisor_email_id;
  String get getSupervisorAddress => _supervisor_address;
  String get getSupervisorCity => _supervisor_city;
  String get getSupervisorState => _supervisor_state;
  String get getSupervisorCountry => _supervisor_country;

  String get getStudentName => _student_name;
  String get getStudentId => _student_id;
  String get getStudentFatherName => _father_name;
  String get getStudentEmailId => _student_email_id;
  String get getStudentRollNo => _student_roll_num;
  String get getStudentAddress => _student_address;
  String get getStudentCity => _student_city;
  String get getStudentState => _student_state;
  String get getStudentPostalNumber => _student_postal_code;
  String get getAmount => _amount;

  void setSupervisorId(value){
    _supervisor_id=value;
  }

  void setSupervisorEmailId(value){
    _supervisor_email_id=value;
  }

  void setSupervisorPersonalEmailId(value){
    _personal_Supervisor_email_id=value;
  }

  void setSupervisorAddress(value){
    _supervisor_address=value;
  }

  void setSupervisorCity(value){
    _supervisor_city=value;
  }

  void setSupervisorState(value){
    _supervisor_state=value;
  }

  void setSupervisorCountry(value){
    _supervisor_country=value;
  }



  void setAmount(value){_amount=value;}

  void setStudentName(value){
    _student_name=value;
  }

  void setStudentId(value){
    _student_id = value;
  }

  void setStudentFatherName(value){
    _father_name = value;
  }

  void setStudentEmailId(value){
    _student_email_id=value;
  }

  void setStudentRollNo(value){
    _student_roll_num=value;
  }

  void setStudentAddress(value){
    _student_address=value;
  }

  void setStudentCity(value){
    _student_city=value;
  }

  void setStudentState(value){
    _student_state=value;
  }

  void setStudentPostalNumber(value){
    _student_postal_code=value;
  }




  void FundingCredentials(context) async{


    try {

      // final SuperVisorProvider = Provider.of<SupervisorService>(context,listen: false);
print("${_student_id}${_supervisor_id}${_student_name}${_amount}");
      // SuperVisorProvider.getSupervisorId
      Response response = await post(
          Uri.parse('http://10.0.2.2:8000/api/store'),
          body: {
            "student_id":_student_id,
            "superwiser_id":_supervisor_id,
            "name":_student_name,
            "amount":_amount


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

      print(e);
      print("Something went wrong 3");
      // show something went wrong    String? auth_token = await getSessionData('auth_token');
    }
  }





}