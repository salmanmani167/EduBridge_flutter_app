import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:sulaman_s_application007/Providers/AuthProvider.dart';
import 'package:sulaman_s_application007/Views/Auth/Register.dart'; // Import the Register screen
import 'package:sulaman_s_application007/Views/Widgets/Auth/auth_heading.dart';
import 'package:sulaman_s_application007/Views/Widgets/Auth/auth_text_field.dart';
import 'package:sulaman_s_application007/Views/Auth/otp.dart';

class logIn extends StatefulWidget {
  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  final RoundedLoadingButtonController _loginbtnController =
  RoundedLoadingButtonController();
  bool _isloading= false;

  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edu Bridge",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.indigo[900],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              AuthHeading(
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
                  email: email,
                  icon: Icons.alternate_email,
                  keyboardType: TextInputType.emailAddress,
                  labelText: "abc@gmail.com",
                  obscureText: false,
                  fontSize: 16.sp,
                  iconsize: 16,
                  labelSize: 16.sp),
              const SizedBox(height: 15),
              Container(
                child: Hero(
                  tag: "Auth",
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo[900],

                      // width: 2000.w,
                      // borderRadius: 10,
                    ),

                    onPressed: () {
                      Timer(Duration(seconds: 3), () async {
                        authProvider.setEmail(email.text.toString());
                        if(await authProvider.login(context))
                        {
                          setState(() {
                            _isloading = true;
                          });
                          _loginbtnController.success();
                          _isloading?Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: OTP())):CircularProgressIndicator();

                        }
                        else{    ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('login details are not correct. Please try again.')),
                        );
                        }

                      });
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),

                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: Register(), // Navigate to the Register screen
                    ),
                  );
                },
                child: Text(
                  "Don't have an account? Register",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.indigo[900],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
