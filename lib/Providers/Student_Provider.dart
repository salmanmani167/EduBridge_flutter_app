import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/StudentModel.dart';
import '../Models/SupervisorModel.dart';

class StudentService with ChangeNotifier {
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





  List<Student> _students = [];

  List<Student> get students => _students;

  Future<void> fetchStudent() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/get/stu/data'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      print("Response Student:${jsonDecode(response.body.toString())}");
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        _students = parseStudents(response.body);
        print(_students);
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
