import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthService with ChangeNotifier {
  String _email = "";
  String get email => _email;
  void setEmail(value){
    _email = value;
    // notifyListeners();
  }
  String _otp = "";
  String get otp => _otp;
  void setOtp(value){
    _otp = value;
    // notifyListeners();
  }
  void login(context) async {
    print("entry");
    print(email);
    try {
      Response response = await post(
          Uri.parse('http://10.0.2.2:8000/api/login'),
          body: {
            "email": email,
          });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        if (data["code"] == 200) {
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
          print("Something went wrong 1");
          // show something went wrong
        }
      } else {
        print("Something went wrong 2");
        // show something went wrong server error
      }
    } catch (e) {
      print(e);
      print("Something went wrong 3");
      // show something went wrong    String? auth_token = await getSessionData('auth_token');
    }
  }
  void otpUser(context) async {
    print("entry");
    print(otp);
    try {
      print(otp.toString());
      Response response = await post(
          Uri.parse('http://10.0.2.2:8000/api/verify/otp'),
          headers: {
            'Accept': 'application/json',
          },
          body: {
            "otp": otp.toString(),
          });

      print("here2");
      print(response.body.toString());
      print(response.toString());
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print("here");
        if (data["code"] == 200) {
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
          print("Something went wrong 1");
          // show something went wrong
        }
      } else {
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
