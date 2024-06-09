import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/SupervisorModel.dart';

class SupervisorService with ChangeNotifier {
   // int _SupervisorId = 0;
   //
   //
   // int get getSupervisorId => _SupervisorId;
   //
   //
   // void setSupervsor(value){
   //   print("checking:${_SupervisorId}");
   //   _SupervisorId = value;
   // }





  List<Supervisor> _supervisors = [];

  List<Supervisor> get supervisors => _supervisors;

  Future<void> fetchSupervisors() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/student/getall/supervisors'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
print("Response:${jsonDecode(response.body.toString())}");
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        _supervisors = parseSupervisors(response.body);
        notifyListeners();
      } else {
        print("Something went wrong 2: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
      print("Something went wrong 3");
    }
  }
}
