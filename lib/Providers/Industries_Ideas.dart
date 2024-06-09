// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
//
// import '../Models/AllIndustriesModel.dart';
//
//
//
// class IndustriesService with ChangeNotifier {
//
//   String _message = "";
//
//   String get message => _message;
//
//   void setMessage(value) {
//     _message = value;
//   }

// String _id = "";
// String get id => _id;
// void setId(value){
//   _id = value;
//   // notifyListeners();
// }
//
// String _author = "";
// String get author => _author;
// void setAuthor(value){
//   _author = value;
//   // notifyListeners();
// }
//
// String _title = "";
// String get title => _title;
// void setTitle(value){
//   _title = value;
//   // notifyListeners();
// }
// String _description = "";
// String get description => _description;
// void setDescription(value){
//   _description = value;
//   // notifyListeners();
// }
// String _status = "";
// String get status => _status;
// void setStatus(value){
//   _status = value;
//   // notifyListeners();
// }
// String _img = "";
// String get img => _img;
// void setImg(value){
//   _img = value;
//   // notifyListeners();
// }
// void industries(context) async {
//   // print("entry");
//   // print(email);
//   try {
//     Response response = await get(
//         Uri.parse('http://10.0.2.2:8000/api/industries/getAllIndustries'),
//         headers: {
//           'Content-type': 'application/json',
//           'Accept': 'application/json',
//         });
//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body.toString());
//       setId(data[0]["id"].toString());
//       setAuthor(data[0]["author"]);
//       setTitle(data[0]["title"]);
//       setStatus(data[0]["status"].toString());
//       setImg(data[0]["image"]);
//       setDescription(data[0]["description"]);
//       print("industries id:${_id}");
//       print("industries author:${_author}");
//       print("industries title:${_title}");
//       print("industries description:${_description}");
//       print("industries status:${_status}");
//       print("industries image:${_img}");
//       if (data["code"] == 200) {
//         // success message
//         // token in session
//         print("Success");
//       } else if (data["code"] == 422) {
//         print("Error 422");
//         // validation error
//         if (data["error_type"] == "general") {
//           print("Error General");
//           // show message parameter
//         } else if (data["error_type"] == "detailed") {
//           print("Error detailed");
//           // show validation_params_error parameter
//         }
//       } else {
//         print("Something went wrong 1");
//         // show something went wrong
//       }
//     } else {
//       print("Something went wrong 2");
//       // show something went wrong server error
//     }
//   } catch (e) {
//     print(e);
//     print("Something went wrong 3");
//     // show something went wrong    String? auth_token = await getSessionData('auth_token');
//   }
// }

// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/AllIndustriesModel.dart';

class IndustriesService with ChangeNotifier {
  String _message = "";
  String get message => _message;
  void setMessage(String value) {
    _message = value;
    notifyListeners();
  }

  List<AllIndustries> _allindustries = [];
  List<AllIndustries> get articles => _allindustries;

  Future<List<AllIndustries>> fetchIndustries() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/industries/getAllIndustries'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        // print(data);  // Debug: Print the data list

        _allindustries = data.map((json) {
          // print(json);  // Debug: Print each JSON object
          return AllIndustries.fromJson(json as Map<String, dynamic>);
        }).toList();
        print("success");
      } else {
        print("Something went wrong 2");
      }
    } catch (e) {
      print(e);
      print("message: $_message");
      print("Something went wrong 3");
    }
    return _allindustries;
  }
}




