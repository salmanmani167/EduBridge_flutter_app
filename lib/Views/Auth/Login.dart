import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:sulaman_s_application007/Views/Auth/otp.dart';
import 'package:sulaman_s_application007/Views/Widgets/Auth/auth_heading.dart';
import '../Widgets/Auth/auth_text_field.dart';

class logIn extends StatelessWidget {
  final RoundedLoadingButtonController _loginbtnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edu Bridge",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color:Colors.white),
        ),
        backgroundColor: Colors.indigo[900],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              new AuthHeading(
                mainText: "Sign in to Edu Bridge",
                subText: "your own FYP partner",
                logo: "assets/images/edulogo.png",
                logoSize: 200,
                fontSize: 15.sp,
              ),
              const SizedBox(
                height: 50,
              ),
              AuthTextField(
                  icon: Icons.alternate_email,
                  keyboardType: TextInputType.emailAddress,
                  labelText: "abc@gmail.com",
                  obscureText: false,
                  fontSize: 16.sp,
                  iconsize: 16,
                  labelSize: 16.sp),
              const SizedBox(height: 15),
              Hero(
                tag: "Auth",
                child: RoundedLoadingButton(
                  controller: _loginbtnController,
                  onPressed: () {
                    Timer(Duration(seconds: 3), () {
                      _loginbtnController.success();
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: OTP()));
                    });
                  },
                  child: Text(
                    "Login",
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
