import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:sulaman_s_application007/Providers/AuthProvider.dart';
import '../Widgets/Auth/auth_heading.dart';
import '../Widgets/Auth/auth_text_field.dart';
import 'Login.dart';
// import 'logIn.dart';  // Import the login screen

class Register extends StatelessWidget {
  final RoundedLoadingButtonController _registerBtnController = RoundedLoadingButtonController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController passwordConfirmation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edu Bridge",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white),
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
                mainText: "Register with Edu Bridge",
                subText: "your own FYP partner",
                logo: "assets/images/edulogo.png",
                logoSize: 200,
                fontSize: 15.sp,
              ),
              const SizedBox(height: 50),
              AuthTextField(
                  email: firstName,
                  icon: Icons.person,
                  keyboardType: TextInputType.name,
                  labelText: "First Name",
                  obscureText: false,
                  fontSize: 16.sp,
                  iconsize: 16,
                  labelSize: 16.sp),
              const SizedBox(height: 15),
              AuthTextField(
                  email: lastName,
                  icon: Icons.person,
                  keyboardType: TextInputType.name,
                  labelText: "Last Name",
                  obscureText: false,
                  fontSize: 16.sp,
                  iconsize: 16,
                  labelSize: 16.sp),
              const SizedBox(height: 15),
              AuthTextField(
                  email: email,
                  icon: Icons.alternate_email,
                  keyboardType: TextInputType.emailAddress,
                  labelText: "Email",
                  obscureText: false,
                  fontSize: 16.sp,
                  iconsize: 16,
                  labelSize: 16.sp),
              const SizedBox(height: 15),
              AuthTextField(
                  email: password,
                  icon: Icons.lock,
                  keyboardType: TextInputType.visiblePassword,
                  labelText: "Password",
                  obscureText: true,
                  fontSize: 16.sp,
                  iconsize: 16,
                  labelSize: 16.sp),
              const SizedBox(height: 15),
              AuthTextField(
                  email: passwordConfirmation,
                  icon: Icons.lock,
                  keyboardType: TextInputType.visiblePassword,
                  labelText: "Confirm Password",
                  obscureText: true,
                  fontSize: 16.sp,
                  iconsize: 16,
                  labelSize: 16.sp),
              const SizedBox(height: 15),
              Hero(
                tag: "Auth",
                child: RoundedLoadingButton(
                  controller: _registerBtnController,
                  onPressed: () {
                    authProvider.setFirstName(firstName.text);
                    authProvider.setLastName(lastName.text);
                    authProvider.setEmail(email.text);
                    authProvider.setPassword(password.text);
                    authProvider.setPasswordConfirmation(passwordConfirmation.text);

                    authProvider.register(context).then((success) {
                      if (success) {
                        _registerBtnController.success();
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: logIn(),  // Redirect to the login screen
                          ),
                        );
                      } else {
                        _registerBtnController.reset();
                        // Display an error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Registration details are not correct. Please try again.')),
                        );
                      }
                    });
                  },
                  child: Text(
                    "Register",
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
