import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
//import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:sulaman_s_application007/Views/Form/fyp_form.dart';
import 'package:sulaman_s_application007/Views/Widgets/Auth/auth_heading.dart';
import 'package:sulaman_s_application007/Views/Widgets/Auth/auth_text_field.dart';

import '../../Providers/AuthProvider.dart';

class OTP extends StatelessWidget {
  final RoundedLoadingButtonController _forgetpasswordbtnController =
  RoundedLoadingButtonController();
  final TextEditingController otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthService>(context,listen: false);
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
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              AuthHeading(
                fontSize: 13.sp,
                logo: "assets/images/edulogo.png",
                logoSize: 200,
                mainText: " Enter OTP",
                subText:
                "please enter the OTP that you \n have recieved on your Email",
              ),
              const SizedBox(
                height: 30,
              ),
              AuthTextField(
                  email: otp,
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
              Hero(
                tag: "Auth",
                child: RoundedLoadingButton(
                  controller: _forgetpasswordbtnController,
                  onPressed: () {
                    Timer(Duration(seconds: 3), () {
                      _forgetpasswordbtnController.success();
                      print("before setting" + otp.toString());
                      authProvider.setOtp(otp.text.toString());
                      authProvider.otpUser(context);

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
