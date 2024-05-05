import "dart:async";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_sizer/flutter_sizer.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:getwidget/getwidget.dart';
import "package:page_transition/page_transition.dart";
import "package:rounded_loading_button_plus/rounded_loading_button.dart";
import "package:sulaman_s_application007/Views/Widgets/FYP%20Form/fyp%20_form_field.dart";
import "package:sulaman_s_application007/Views/Widgets/FYP%20Form/form_heading.dart";
import "package:sulaman_s_application007/Views/Widgets/FYP%20Form/form_sub_heading.dart";

class FypForm extends StatefulWidget {
  @override
  State<FypForm> createState() => _FypFundingFormState();
}

class _FypFundingFormState extends State<FypForm> {
  final RoundedLoadingButtonController _SaveProfilebtnController =
      RoundedLoadingButtonController();
  String _dropdownvalue = '1';
  var items = [
    'ALi',
    'Nashit',
    'Arsal',
    'Zain',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.indigo[900],
                  borderRadius: BorderRadius.vertical(
                    bottom:
                        //mediaquery will calculate the width of the device and calculating how much beval we gonna apply on that device
                        Radius.elliptical(
                            MediaQuery.of(context).size.width, 150),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.view_list_sharp,
                          color: Colors.white,
                          size: 23,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "FYP Form",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            FormHeading(heading: "Student Details"),

                            FormSubHeading(subheading: "First Name"),
                            FypFormField(
                              keyboardType: TextInputType.name,
                              obscureText: false,
                              fontSize: 12,
                              PlaceholderText: "Enter your first name",
                              PlaceholderTextSize: 12,
                            ),
                            FormSubHeading(subheading: "Last Name"),
                            FypFormField(
                              keyboardType: TextInputType.name,
                              obscureText: false,
                              fontSize: 12,
                              PlaceholderText: "Enter your last name",
                              PlaceholderTextSize: 12,
                            ),
                            // it's a dropdown
                            FormSubHeading(
                              subheading: "Department",
                            ),
                            FypFormField(
                                keyboardType: TextInputType.none,
                                PlaceholderText: "Select Department",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12),
                            FormSubHeading(
                              subheading: "Email ID",
                            ),
                            FypFormField(
                                keyboardType: TextInputType.emailAddress,
                                PlaceholderText: "Enter your student mail ID",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12),
                            FormSubHeading(
                              subheading: "Personal Email ID",
                            ),
                            FypFormField(
                                keyboardType: TextInputType.emailAddress,
                                PlaceholderText: "Enter your personal mail ID",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12),
                            //it's a dropdown
                            FormSubHeading(
                              subheading: "Session",
                            ),
                            FypFormField(
                                keyboardType: TextInputType.none,
                                PlaceholderText: "Select Session",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12),
                                 FormSubHeading(
                              subheading: "Student ID",
                            ),
                            FypFormField(
                                keyboardType: TextInputType.none,
                                PlaceholderText: "Pleas enter you Student ID",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12),
                                 FormSubHeading(
                              subheading: "Project ID",
                            ),
                            FypFormField(
                                keyboardType: TextInputType.none,
                                PlaceholderText: "Pleas enter you Project ID",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12),
                                 FormSubHeading(
                              subheading: "Supervisor",
                            ),
                            FypFormField(
                                keyboardType: TextInputType.none,
                                PlaceholderText: "Pleas select your Supervisor",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12),
                               SizedBox(height: 30,),
                            //button detials
                            Hero(
                              tag: "Auth",
                              child: RoundedLoadingButton(
                                controller: _SaveProfilebtnController,
                                onPressed: () {
                                  Timer(Duration(seconds: 3), () {
                                    _SaveProfilebtnController.success();
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FypForm()));
                                  });
                                },
                                child: Text(
                                  "Save Form",
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
