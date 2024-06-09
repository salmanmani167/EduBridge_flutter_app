import "dart:async";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_sizer/flutter_sizer.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:getwidget/getwidget.dart';
import "package:page_transition/page_transition.dart";
import "package:provider/provider.dart";
import "package:rounded_loading_button_plus/rounded_loading_button.dart";
import "package:sulaman_s_application007/Providers/Funding_Provider.dart";
import "package:sulaman_s_application007/Providers/Student_Provider.dart";
import "package:sulaman_s_application007/Views/Form/fyp_form.dart";
import "package:sulaman_s_application007/Views/Homepage/home_page.dart";
import "package:sulaman_s_application007/Views/Widgets/FYP%20Form/drop_down.dart";
import "package:sulaman_s_application007/Views/Widgets/FYP%20Form/fyp%20_form_field.dart";
import "package:sulaman_s_application007/Views/Widgets/FYP%20Form/form_heading.dart";
import "package:sulaman_s_application007/Views/Widgets/FYP%20Form/form_sub_heading.dart";

import "../../Models/StudentModel.dart";
import "../../Models/SupervisorModel.dart";
import "../../Providers/Supervisor_Provider.dart";

class FundingForm extends StatefulWidget {
  @override
  State<FundingForm> createState() => _FypFundingFormState();
}

class _FypFundingFormState extends State<FundingForm> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<StudentService>(context, listen: false).fetchStudent();
    super.initState();
  }
  TextEditingController amountController = TextEditingController();
  Supervisor? selectedSupervisor;
  Student? selectedStudent;
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
                            Consumer<SupervisorService>(
                              builder: (context, supervisorService, child) {
                                if (supervisorService.supervisors.isEmpty) {
                                  return CircularProgressIndicator();
                                } else {
                                  return ReusableDropDownSupervisor(
                                    hint: 'Select Supervisor',
                                    items: supervisorService.supervisors,
                                    value: selectedSupervisor,
                                    onChanged: (Supervisor? newValue) {
                                      setState(() {
                                        selectedSupervisor = newValue;
                                      });
                                      // Access the selected supervisor's id
                                      if (newValue != null) {
                                        final FundingProvider = Provider.of<FundingService>(context,listen: false);
                                        FundingProvider.setSupervisorId(newValue.id.toString());
                                        // final FypProvider = Provider.of<FypService>(context,listen: false);
                                        //
                                        print('Selected supervisor id: ${newValue.id}');
                                        // _selectedSupervisor=newValue.id.toString();
                                        // SuperVisorProvider.setSupervsor(newValue.id);
                                        // FypProvider.setFypSupervisor(newValue.id);
                                      }

                                    },
                                  );
                                }
                              },
                            ),
                            // ReusableDropDown(
                            //   items: [
                            //     "Dr. Usman Aftab",
                            //     "Dr. Usman Mughal",
                            //     "Dr Ali"
                            //   ],
                            //   value: _SelectedSupervisor,
                            //   onChanged: (newValue) {
                            //     setState(() {
                            //       _SelectedSupervisor =
                            //           newValue!; // Update the selected option
                            //     });
                            //   },
                            // ),
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
                            Consumer<StudentService>(
                              builder: (context, studentService, child) {
                                print("Student data:${studentService.students}");
                                if (studentService.students.isEmpty) {
                                  Provider.of<StudentService>(context, listen: false).fetchStudent();
                                  return CircularProgressIndicator();
                                } else {
                                  return ReusableDropDownStudent(
                                    hint: 'Select Student',
                                    items: studentService.students,
                                    value: selectedStudent,
                                    onChanged: (Student? newValue) {setState(() {
                                        selectedStudent = newValue;
                                      });
                                      // Access the selected supervisor's id
                                      if (newValue != null) {
                                        var full_name = newValue!.firstName + " "+newValue!.lastName;
                                        // final SuperVisorProvider = Provider.of<SupervisorService>(context,listen: false);
                                        final FundingProvider = Provider.of<FundingService>(context,listen: false);
                                        FundingProvider.setStudentName(full_name.toString());
                                        FundingProvider.setStudentId(newValue.id.toString());
                                        //
                                        print('Selected student id: ${newValue.id}');
                                        // _selectedSupervisor=newValue.id.toString();
                                        // SuperVisorProvider.setSupervsor(newValue.id);
                                        // FypProvider.setFypSupervisor(newValue.id);
                                      }

                                    },
                                  );
                                }
                              },
                            ),
                            // ReusableDropDown(
                            //   items: [
                            //     "Muhammad Ali",
                            //     "Arsal",
                            //     "Muhammad Awais",
                            //     "Muhammad Sulaman"
                            //   ],
                            //   value: _SelectedStudent,
                            //   onChanged: (newValue) {
                            //     setState(() {
                            //       _SelectedStudent =
                            //           newValue!; // Update the selected option
                            //     });
                            //   },
                            // ),
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
                              subheading: "Amount",
                            ),
                            FypFormField(
                              feild: amountController,
                                keyboardType: TextInputType.number,
                                PlaceholderText: "Enter Amount",
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
                            
                            //button detials
                            Hero(
                              tag: "Auth",
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: RoundedLoadingButton(
                                  controller: _SaveProfilebtnController,
                                  onPressed: () {
                                    final FundingProvider = Provider.of<FundingService>(context,listen: false);
                                    FundingProvider.setAmount(amountController.text.toString());
                                    Timer(Duration(seconds: 3), () {
                                      _SaveProfilebtnController.success();
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: HomePage()));
                                    });
                                    FundingProvider.FundingCredentials(context);
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
