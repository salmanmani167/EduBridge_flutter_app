import "dart:async";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_sizer/flutter_sizer.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:getwidget/getwidget.dart';
import "package:page_transition/page_transition.dart";
import "package:provider/provider.dart";
import "package:rounded_loading_button_plus/rounded_loading_button.dart";
import "package:sulaman_s_application007/Providers/Fyp_Provider.dart";
import "package:sulaman_s_application007/Providers/Student_Provider.dart";
import "package:sulaman_s_application007/Providers/Supervisor_Provider.dart";
import "package:sulaman_s_application007/Views/Homepage/Dashboard.dart";
import "package:sulaman_s_application007/Views/Homepage/home_page.dart";
import "package:sulaman_s_application007/Views/Widgets/FYP%20Form/drop_down.dart";
import "package:sulaman_s_application007/Views/Widgets/FYP%20Form/fyp%20_form_field.dart";
import "package:sulaman_s_application007/Views/Widgets/FYP%20Form/form_heading.dart";
import "package:sulaman_s_application007/Views/Widgets/FYP%20Form/form_sub_heading.dart";

import "../../Models/SupervisorModel.dart";
import "../../Providers/Industries_Ideas.dart";

class FypForm extends StatefulWidget {
  @override
  State<FypForm> createState() => _FypFundingFormState();
}

class _FypFundingFormState extends State<FypForm> {
  Supervisor? selectedSupervisor;
  //Team Lead
  // String first_name = "";
  // String last_name = "";
  // String department_name = "";
  // String emailid = "";
  // String personel_emailid = "";
  // String session = "";
  // int studentId = 0;

  //Project Partener
  // String pp_first_name = "";
  // String pp_last_name = "";
  // String pp_department_name = "";
  // String pp_emailid = "";
  // String pp_personel_emailid = "";
  // String pp_session = "";
  // int pp_studentId = 0;

  //FYP Details
  // int project_id = 0;
  // String supervisor = "";
  @override
  void initState() {
    Provider.of<SupervisorService>(context, listen: false).fetchSupervisors();
    Provider.of<StudentService>(context, listen: false).fetchStudent();
    print("hereee");
  // supervisorProvider.fetchSupervisors();

    // TODO: implement initState
    super.initState();
  }
  final RoundedLoadingButtonController _SaveProfilebtnController =
      RoundedLoadingButtonController();
  String _selectedSession = '';
 String _selectedDepartment = '';
 String _ppselectedSession = '';
 String _ppselectedDepartment = '';
 String _selectedSupervisor = "";
 TextEditingController projecttitle = TextEditingController();
 TextEditingController firstname = TextEditingController();
 TextEditingController lastname = TextEditingController();
 TextEditingController department = TextEditingController();
 TextEditingController emailid = TextEditingController();
 TextEditingController personelemailid = TextEditingController();
 TextEditingController session = TextEditingController();
 TextEditingController studentid = TextEditingController();
 TextEditingController ppfirstname = TextEditingController();
 TextEditingController pplastname = TextEditingController();
 TextEditingController ppdepartment = TextEditingController();
 TextEditingController ppemailid = TextEditingController();
 TextEditingController pppersonelemailid = TextEditingController();
 TextEditingController ppsession = TextEditingController();
 TextEditingController ppstudentid = TextEditingController();
 TextEditingController fypprojectid = TextEditingController();
 TextEditingController fypsupervisor = TextEditingController();
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
                                    "FYP Form",
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
                            FormHeading(heading: "Team Lead"),

                            FormSubHeading(subheading: "Project Title"),

                            FypFormField(
                              keyboardType: TextInputType.name,
                              obscureText: false,
                              fontSize: 12,
                              PlaceholderText: "Enter your Project Title",
                              PlaceholderTextSize: 12,
                              feild: projecttitle,
                            ),
                            FormSubHeading(subheading: "First Name"),
                            FypFormField(
                              keyboardType: TextInputType.name,
                              obscureText: false,
                              fontSize: 12,
                              PlaceholderText: "Enter your first name",
                              PlaceholderTextSize: 12,
                              feild: firstname,
                            ),
                            FormSubHeading(subheading: "Last Name"),
                            FypFormField(
                              keyboardType: TextInputType.name,
                              obscureText: false,
                              fontSize: 12,
                              PlaceholderText: "Enter your last name",
                              PlaceholderTextSize: 12,
                              feild: lastname,
                            ),
                            // it's a dropdown
                            FormSubHeading(
                              subheading: "Department",
                            ),
                             ReusableDropDown(
                              items: [
                                "BSCS",
                                "BS SE",
                                "BBA (Hons)",
                                "BS AF",
                                "BS AP",
                                "BS BCH",
                                "BS CHEM.",
                                "BS ENG.",
                                "BS IT",
                                "BS MATHS",
                                "SE",],
                              value: _selectedDepartment,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedDepartment =
                                      newValue!; // Update the selected option
                                });
                              },
                            ),
                    
                            FormSubHeading(
                              subheading: "Email ID",
                            ),
                            FypFormField(
                                keyboardType: TextInputType.emailAddress,
                                PlaceholderText: "Enter your student mail ID",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12,
                              feild: emailid,),
                            FormSubHeading(
                              subheading: "Personal Email ID",
                            ),
                            FypFormField(
                                keyboardType: TextInputType.emailAddress,
                                PlaceholderText: "Enter your personal mail ID",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12,
                              feild: personelemailid,),
                            //it's a dropdown
                            FormSubHeading(
                              subheading: "Session",
                            ),
                            ReusableDropDown(
                              items: ["2015", "2016", "2017","2018", "2019", "2020","2021", "2022", "2023","2024"],
                              value: _selectedSession,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedSession =
                                      newValue!; // Update the selected option
                                });
                              },
                            ),
                            FormSubHeading(
                              subheading: "Student ID",
                            ),
                            FypFormField(
                                keyboardType: TextInputType.text,
                                PlaceholderText: "Pleas enter you Student ID",
                                obscureText: false,
                                fontSize: 12,
                                feild: studentid,
                                PlaceholderTextSize: 12),
                            SizedBox(
                              height: 20,
                            ),
                            FormHeading(heading: "Project Partner's Detais"),

                            FormSubHeading(subheading: "First Name"),
                            FypFormField(
                              keyboardType: TextInputType.name,
                              obscureText: false,
                              fontSize: 12,
                              PlaceholderText:
                                  "Enter your Partner's first name",
                              PlaceholderTextSize: 12,
                              feild: ppfirstname,
                            ),
                            FormSubHeading(subheading: "Last Name"),
                            FypFormField(
                              keyboardType: TextInputType.name,
                              obscureText: false,
                              fontSize: 12,
                              PlaceholderText: "Enter your partner's last name",
                              PlaceholderTextSize: 12,
                              feild: pplastname,
                            ),
                            // it's a dropdown
                            FormSubHeading(
                              subheading: "Department",
                            ),
                             ReusableDropDown(
                               items: [
                                 "BSCS",
                                 "BS SE",
                                 "BBA (Hons)",
                                 "BS AF",
                                 "BS AP",
                                 "BS BCH",
                                 "BS CHEM.",
                                 "BS ENG.",
                                 "BS IT",
                                 "BS MATHS",
                                 "SE",],
                              value: _ppselectedDepartment,
                              onChanged: (newValue) {
                                setState(() {
                                  _ppselectedDepartment =
                                      newValue!; // Update the selected option
                                });
                              },
                            ),
                            
                            FormSubHeading(
                              subheading: "Email ID",
                            ),
                            FypFormField(
                                keyboardType: TextInputType.emailAddress,
                                PlaceholderText:
                                    "Enter your partner's student mail ID",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12,
                            feild: ppemailid,
                            ),
                            FormSubHeading(
                              subheading: "Personal Email ID",
                            ),
                            FypFormField(
                                keyboardType: TextInputType.emailAddress,
                                PlaceholderText: "Enter your partner's mail ID",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12,
                            feild: pppersonelemailid,
                            ),
                            //it's a dropdown
                            FormSubHeading(
                              subheading: "Session",
                            ),
                            ReusableDropDown(
                              items: ["2015", "2016", "2017","2018", "2019", "2020","2021", "2022", "2023","2024"],
                              value: _ppselectedSession,
                              onChanged: (newValue) {
                                setState(() {
                                  _ppselectedSession =
                                      newValue!; // Update the selected option
                               print("ppSession${_ppselectedSession}"); });
                              },
                            ),

                            FormSubHeading(
                              subheading: "Student ID",
                            ),
                            FypFormField(
                                keyboardType: TextInputType.text,
                                PlaceholderText: "Pleas enter you Patt ID",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12,
                            feild: ppstudentid,
                            ),

                            SizedBox(
                              height: 30,
                            ),
                            FormHeading(heading: "FYP Details"),
                            FormSubHeading(
                              subheading: "Project ID",
                            ),
                            FypFormField(
                                keyboardType: TextInputType.text,
                                PlaceholderText: "Pleas enter you Project ID",
                                obscureText: false,
                                fontSize: 12,
                                PlaceholderTextSize: 12,
                            feild: fypprojectid,
                            ),
                            FormSubHeading(
                              subheading: "Supervisor",
                            ),
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
                                        final SuperVisorProvider = Provider.of<SupervisorService>(context,listen: false);
                                        final FypProvider = Provider.of<FypService>(context,listen: false);

                                        print('Selected supervisor id: ${newValue.id}');
                                        _selectedSupervisor=newValue.id.toString();
                                        // SuperVisorProvider.setSupervsor(newValue.id);
                                        // FypProvider.setFypSupervisor(newValue.id);
                                      }

                                    },
                                  );
                                }
                              },
                            ),
                            // ReusableDropDown(
                            //   items: ["Dr. Usman Aftab", "Dr. Usman Mughal", "Dr Ali"],
                            //   value: _selectedSupervisor,
                            //   onChanged: (newValue) {
                            //     setState(() {
                            //       _selectedSupervisor =
                            //           newValue!; // Update the selected option
                            //     });
                            //   },
                            // ),
                            SizedBox(
                              height: 30,
                            ),
                            //button detials
                            Hero(
                              tag: "Auth",
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: RoundedLoadingButton(
                                  controller: _SaveProfilebtnController,
                                  onPressed: () {
                                    // final dashboardProvider = Provider.of<IndustriesService>(context,listen: false);
                                    final FypProvider = Provider.of<FypService>(context,listen: false);
                                    // dashboardProvider.industries(context);

                                    FypProvider.setProjectTitle(projecttitle.text.toString());
                                    FypProvider.setFirstName(firstname.text.toString());
                                    FypProvider.setLastName(lastname.text.toString());
                                    FypProvider.setDepartmentName(_selectedDepartment.toString());
                                    FypProvider.setEmailId(emailid.text.toString());
                                    FypProvider.setPersonelEmailId(personelemailid.text.toString());
                                    FypProvider.setSession(_selectedSession.toString());
                                    FypProvider.setStudentId(studentid.text.toString());
                                    ///////////////////////////////////////////////////
                                    FypProvider.setPPFirstName(ppfirstname.text.toString());
                                    FypProvider.setPPLastName(pplastname.text.toString());
                                    FypProvider.setPPDepartmentName(_ppselectedDepartment.toString());
                                    FypProvider.setPPEmailId(ppemailid.text.toString());
                                    FypProvider.setPPPersonelEmailId(pppersonelemailid.text.toString());
                                    FypProvider.setPPSession(_ppselectedSession.toString());
                                    FypProvider.setPPStudentId(ppstudentid.text.toString());
                                    ////////////////////////////////////////////
                                    FypProvider.setFypProjectId(fypprojectid.text.toString());
                                    FypProvider.setFypSupervisor(_selectedSupervisor.toString());
                                    Timer(Duration(seconds: 3), () {
                                      FypProvider.FypCredentials(context);
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
