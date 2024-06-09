import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:sulaman_s_application007/Providers/Messages_Provider.dart';
import 'package:sulaman_s_application007/Views/Auth/otp.dart';

class AuthService with ChangeNotifier {
  String _email = "";

  String get email => _email;

  void setEmail(value) {
    _email = value;
    // notifyListeners();
  }

  String _firstName = "";

  String get firstName => _firstName;

  void setFirstName(value) {
    _firstName = value;
    // notifyListeners();
  }

  String _lastName = "";

  String get lastName => _lastName;

  void setLastName(value) {
    _lastName = value;
    // notifyListeners();
  }

  String _password = "";

  String get password => _password;

  void setPassword(value) {
    _password = value;
    // notifyListeners();
  }

  String _passwordConfirmation = "";

  String get passwordConfirmation => _passwordConfirmation;

  void setPasswordConfirmation(value) {
    _passwordConfirmation = value;
    // notifyListeners();
  }

  String _otp = "";

  String get otp => _otp;

  void setOtp(value) {
    _otp = value;
    // notifyListeners();
  }

  Future<bool> login(context) async {
    bool flag = false;
    try {
      Response response = await post(
          Uri.parse('http://10.0.2.2:8000/api/login'),
          body: {
            "email": email,
          });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => OTP()));
        print(data);
        if (data["code"] == 200) {
          flag = true;
          print("LOGIN HORHAAAAAA");
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
          print(data([""]));
          print("Something went wrong 1");
          // show something went wrong
        }
      } else {
        print("Something went wrong 2");
        // show something went wrong server error
      }
      return flag;
    } catch (e) {
      print(e);
      print("Something went wrong 3");
      return flag;
      // show something went wrong    String? auth_token = await getSessionData('auth_token');
    }
  }

  Future<bool> otpUser(BuildContext context) async {
    try {
      Response response = await post(
        Uri.parse('http://10.0.2.2:8000/api/verify/otp'),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          "otp": otp.toString(),
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        if (data["success"]) {
          var messageProvider = Provider.of<MessagingService>(context, listen: false);
          messageProvider.setAuthToken(data['token']);
          return true;  // OTP verification successful
        }
      }
      return false; // OTP verification failed
    } catch (e) {
      print("Exception caught: $e");
      return false; // Error occurred
    }
  }

  Future<bool> register(BuildContext context) async {
    try {
      Response response = await post(
        Uri.parse('http://10.0.2.2:8000/api/register'),
        body: {
          "first_name": _firstName,
          "last_name": _lastName,
          "email": _email,
          "password": _password,
          "password_confirmation": _passwordConfirmation,
        },
      );

      if (response.statusCode == 201) {
        // Registration successful
        return true;
      } else if (response.statusCode == 422) {
        // Validation error
        var data = jsonDecode(response.body.toString());
        print("Error 422: ${data["error_type"] == "general"
            ? "General error"
            : "Detailed error"}");
      } else {
        print("Unexpected error code: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception caught during registration: $e");
    }
    // Registration failed
    return false;
  }
}