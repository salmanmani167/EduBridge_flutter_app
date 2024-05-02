import "dart:async";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_sizer/flutter_sizer.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:getwidget/getwidget.dart';
import "package:page_transition/page_transition.dart";
import "package:rounded_loading_button_plus/rounded_loading_button.dart";
import "package:sulaman_s_application007/Views/Widgets/Profile/form_setting_heading.dart";
import "package:sulaman_s_application007/Views/Widgets/Profile/form_setting_sub_heading.dart";

class FypFundingForm extends StatefulWidget {
  @override
  State<FypFundingForm> createState() => _FypFundingFormState();
}

class _FypFundingFormState extends State<FypFundingForm> {
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
                          "FYP Funding Form",
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
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Kashaf ud duja",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.nunito(
                                        color: Colors.black,
                                        fontSize: 15,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.w900),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ProfileSettingHeading(
                                heading: "Supervisor Details"),
                            const SizedBox(
                              height: 10,
                            ),
                            ProfileSettingSubHeading(
                                subheading: "Supervisor Name"),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Container(
                                width: 180,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:Center(
                                  child: DropdownButton(
                                      items: items.map((String items) {
                                        return DropdownMenuItem(
                                            value: items, child: Text(items));
                                      }).toList(),
                                      onChanged: (String ? newvalue){
                                        setState(() {
                                          _dropdownvalue = newvalue!;
                                        });
                                        value: _dropdownvalue;
                                      }),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ProfileSettingHeading(
                                heading: "Notification Settings"),
                            const SizedBox(
                              height: 15,
                            ),
                            ProfileSettingSubHeading(
                              subheading: "Push Notifications",
                              secondarywidget: GFToggle(
                                onChanged: (val) {},
                                value: true,
                                enabledTrackColor: Colors.green,
                                type: GFToggleType.android,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ProfileSettingHeading(
                                heading: "Application Settings"),
                            const SizedBox(
                              height: 15,
                            ),
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
                                            child: FypFundingForm()));
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
