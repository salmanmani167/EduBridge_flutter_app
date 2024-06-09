import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:sulaman_s_application007/Providers/Fyp_Provider.dart';


class MessagingService with ChangeNotifier{
  String _authToken  = "";
  String _sentMessage = "";
  String _supervisorMessage = "";
  String _currentMessage = "";

  String get getAuthToken => _authToken;
  String get getSentMessage => _sentMessage;
  String get getSupervisorMessage => _supervisorMessage;
  String get getCurrentMessage => _currentMessage;



  void setAuthToken(value){
    print("Auth Code:   ${value}");
    _authToken = value;}
  void setCurrentMessage(value){
    // print("Auth Code:   ${value}");
    _currentMessage = value;
  notifyListeners();
  }

   void setSentMessage(value){
    _sentMessage = value;
    print(value);
  }
   void setSupervisorMessage(value){
     _supervisorMessage = value;
     notifyListeners();
    // print(value);
  }


  Future<void> fetchSupervisorMessages(context) async {
    final FypProvider = Provider.of<FypService>(context,listen: false);

    try {
      final response = await get(
        Uri.parse('http://10.0.2.2:8000/api/message/get'),
        headers: {
          // 'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $_authToken',
        },
        // body: {
        //   "supervisor_id":FypProvider.getFypSupervisor
        // }
      );
      // print("Response Student:${jsonDecode(response.body.toString())}");
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        // _students = parseStudents(response.body);
        // Parse the JSON response
        Map<String, dynamic> parsedResponse = jsonData;
        List<dynamic> messages = parsedResponse['messages'];

        // Filter messages where sender_type is "superwiser"
        List<dynamic> superwiserMessages = messages.where((message) {
          return message['sender_type'] == 'superwiser';
        }).toList();

        // Output the filtered list
        // print(superwiserMessages.last["content"]);
        // print(superwiserMessages.length);
        print("Helo how are you");
        setCurrentMessage(superwiserMessages.last["content"].toString());
        setSupervisorMessage(superwiserMessages.last["content"].toString());
        // print(jsonData.toString());
        // notifyListeners();
      } else {
        print("Something went wrong 2: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
      print("Something went wrong 3");
    }
  }







  void sendMessage(context) async{
    try {

      // final SuperVisorProvider = Provider.of<SupervisorService>(context,listen: false);

      // SuperVisorProvider.getSupervisorId
      Response response = await post(
          Uri.parse('http://10.0.2.2:8000/api/message/store'),
          headers: {
            'Authorization': 'Bearer $_authToken',
          },
          body: {
            "content":_sentMessage


          });
      var msg = jsonDecode(response.body.toString());
      // setMessage(msg);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        // print(data);

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