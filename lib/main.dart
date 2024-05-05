// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:sulaman_s_application007/Views/Auth/Login.dart';
import 'package:sulaman_s_application007/Views/Auth/otp.dart';
import 'package:sulaman_s_application007/Views/Homepage/home_page.dart';
import 'package:sulaman_s_application007/Views/Form/fyp_form.dart';
void main() {
  runApp(EduBridge());
}

class EduBridge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
          return FlutterSizer(
            builder: (context, orientation, screenType) {
            return MaterialApp(
              title: 'Education Bridge',
              home: logIn(),
              debugShowCheckedModeBanner: false,
            );
            }
          );
  }
}
 
