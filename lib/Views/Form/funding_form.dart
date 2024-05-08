import "dart:async";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_sizer/flutter_sizer.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:getwidget/getwidget.dart';
import "package:page_transition/page_transition.dart";
import "package:rounded_loading_button_plus/rounded_loading_button.dart";
import "package:sulaman_s_application007/Views/Form/fyp_form.dart";
import "package:sulaman_s_application007/Views/Homepage/home_page.dart";
import "package:sulaman_s_application007/Views/Widgets/FYP%20Form/drop_down.dart";
import "package:sulaman_s_application007/Views/Widgets/FYP%20Form/fyp%20_form_field.dart";
import "package:sulaman_s_application007/Views/Widgets/FYP%20Form/form_heading.dart";
import "package:sulaman_s_application007/Views/Widgets/FYP%20Form/form_sub_heading.dart";

class FundingForm extends StatefulWidget {
  @override
  State<FundingForm> createState() => _FypFundingFormState();
}

class _FypFundingFormState extends State<FundingForm> {
  final RoundedLoadingButtonController _SaveProfilebtnController =
      RoundedLoadingButtonController();
  String _SelectedSupervisor = '';
  String _SelectedStudent = '';
  String _SelectedDonor = '';
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
                      height: 80,
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
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.list,
                                    size: 30,
                                  ),
                                  Text(
                                    "Funding Form",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.nunito(
                                      color: Colors.black,
                                      fontSize: 20,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            FormHeading(heading: "Supervisor Details"),

                            FormSubHeading(subheading: "Name"),
                            ReusableDropDown(
                              items: [
                                "Dr. Usman Aftab",
                                "Dr. Usman Mughal",
                                "Dr Ali"
                              ],
                              value: _SelectedSupervisor,
                              onChanged: (newValue) {
                                setState(() {
                                  _SelectedSupervisor =
                                      newValue!; // Update the selected option
                                });
                              },
                            ),
                            FormSubHeading(
                              subheading: "Email Address",
                            ),
                            FypFormField(
                                keyboardType: TextInputType.emailAddress,
                                PlaceholderText:
                                    "Enter your Supervisor's mailing Address",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12),
                            FormSubHeading(
                              subheading: "Supervisor's Personal Email ID",
                            ),
                            FypFormField(
                                keyboardType: TextInputType.emailAddress,
                                PlaceholderText:
                                    "Enter your Supervisor's personal mail ID",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12),
                            FormSubHeading(
                              subheading: "Address",
                            ),
                            FypFormField(
                                keyboardType: TextInputType.streetAddress,
                                PlaceholderText: "Enter Address",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12),
                            SizedBox(
                              height: 20,
                            ),
                            FypFormField(
                                keyboardType: TextInputType.streetAddress,
                                PlaceholderText: "Enter City",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12),
                            SizedBox(
                              height: 20,
                            ),
                            FypFormField(
                                keyboardType: TextInputType.streetAddress,
                                PlaceholderText: "Enter State",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12),
                            SizedBox(
                              height: 20,
                            ),
                            FypFormField(
                                keyboardType: TextInputType.streetAddress,
                                PlaceholderText: "Enter Country",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12),

                            SizedBox(
                              height: 20,
                            ),
                            FormHeading(heading: "Project Team Lead"),

                            FormSubHeading(subheading: "Student Name"),
                            ReusableDropDown(
                              items: [
                                "Muhammad Ali",
                                "Arsal",
                                "Muhammad Awais"
                                    "Muhammad Sulaman"
                              ],
                              value: _SelectedStudent,
                              onChanged: (newValue) {
                                setState(() {
                                  _SelectedStudent =
                                      newValue!; // Update the selected option
                                });
                              },
                            ),
                            FormSubHeading(subheading: "Father Name"),
                            FypFormField(
                              keyboardType: TextInputType.name,
                              obscureText: false,
                              fontSize: 12,
                              PlaceholderText: "Enter your Father name",
                              PlaceholderTextSize: 12,
                            ),
                            FormSubHeading(
                              subheading: "Personal Email ID",
                            ),
                            FypFormField(
                                keyboardType: TextInputType.emailAddress,
                                PlaceholderText: "Enter your partner's mail ID",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12),

                            FormSubHeading(
                              subheading: "Student ID/Roll Number",
                            ),
                            FypFormField(
                                keyboardType: TextInputType.none,
                                PlaceholderText:
                                    "Pleas enter you Student ID/Roll Number",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12),
                            FormSubHeading(
                              subheading: "Postal Address",
                            ),
                            FypFormField(
                                keyboardType: TextInputType.streetAddress,
                                PlaceholderText: "Enter Address",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12),
                            SizedBox(
                              height: 20,
                            ),
                            FypFormField(
                                keyboardType: TextInputType.streetAddress,
                                PlaceholderText: "Enter City",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12),
                            SizedBox(
                              height: 20,
                            ),
                            FypFormField(
                                keyboardType: TextInputType.streetAddress,
                                PlaceholderText: "Enter State",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12),
                                 SizedBox(
                              height: 20,
                            ),
                            FypFormField(
                                keyboardType: TextInputType.streetAddress,
                                PlaceholderText: "Enter Postal Code",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12),
                            SizedBox(
                              height: 30,
                            ),
                            FormHeading(heading: "Donor Details"),
                            FormSubHeading(
                              subheading: "Select Donor",
                            ),
                            ReusableDropDown(
                              items: [
                                "Muhammad Ali",
                                "Arsal",
                                "Muhammad Awais"
                                "Muhammad Sulaman"
                              ],
                              value: _SelectedDonor,
                              onChanged: (newValue) {
                                setState(() {
                                  _SelectedDonor =
                                      newValue!; // Update the selected option
                                });
                              },
                            ),
                            FormSubHeading(
                              subheading: "Enter Amount",
                            ),
                            FypFormField(
                                keyboardType: TextInputType.number,
                                PlaceholderText: "Enter your Required Amount",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12),

                            SizedBox(
                              height: 30,
                            ),
                            //button detials
                            Hero(
                              tag: "Auth",
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: RoundedLoadingButton(
                                  controller: _SaveProfilebtnController,
                                  onPressed: () {
                                    Timer(Duration(seconds: 3), () {
                                      _SaveProfilebtnController.success();
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: HomePage()));
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
                            ),
                             SizedBox(
                              height: 20,
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
