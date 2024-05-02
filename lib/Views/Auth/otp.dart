import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
//import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:sulaman_s_application007/Views/Profile/fyp_form.dart';
import 'package:sulaman_s_application007/Views/Widgets/Auth/auth_heading.dart';
import 'package:sulaman_s_application007/Views/Widgets/Auth/auth_text_field.dart';

class OTP extends StatelessWidget {
  final RoundedLoadingButtonController _forgetpasswordbtnController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Education Bridge",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: Colors.white),
        ),
        backgroundColor: Colors.indigo[900],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              AuthHeading(
                fontSize: 13.sp,
                logo: "assets/images/1.jpg",
                logoSize: 80.sp,
                mainText: " Enter OTP",
                subText:
                    "please enter the OTP that you \n have recieved on your Email",
              ),
              const SizedBox(
                height: 30,
              ),
              AuthTextField(
                  icon: Icons.alternate_email,
                  keyboardType: TextInputType.emailAddress,
                  labelText: "Enter OTP",
                  obscureText: false,
                  fontSize: 20.sp,
                  iconsize: 12.sp,
                  labelSize: 12.sp),
                  const SizedBox(
                height: 30,
              ),
                  Text("to request for a new password,type your email address and the passsword will be sent to that mail",
                      style: GoogleFonts.poppins(
                          fontSize: 10.sp, color: Colors.black87,),
                          textAlign:TextAlign.center ,),
                          const SizedBox(
                height: 30,
              ),
                Hero(
                tag: "Auth",
                child: RoundedLoadingButton(
                  controller: _forgetpasswordbtnController,
                  onPressed: () {
                    Timer(Duration(seconds: 3), () {
                      _forgetpasswordbtnController.success();
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: FypForm()));
                    });
                  },
                  child: Text(
                    "Confirm OTP",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  color: Colors.indigo[900],
                  width: 2000.w,
                  borderRadius: 10,
                ),
              ),
            ],
            
            
          ),
          
        ),
      ),
    );
  }
}
