import 'dart:ui';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sulaman_s_application007/Views/Widgets/Dashboard/dashboard_gradient_feature.dart';

class DashBoard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            alignment: Alignment.center,
            child: 
            Text(
              "Dashboard",
              style: GoogleFonts.nunito(
                  color: Colors.indigo[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(25),
            width: double.infinity,
            child: Card(
              elevation: 10,
              color: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 25),
                          child: CircularProfileAvatar(
                            "",
                            backgroundColor: Colors.yellow,
                            borderWidth: 1,
                            borderColor: Colors.black,
                            elevation: 20,
                            radius: 40,
                            cacheImage: true,
                            errorWidget: (context, url, error) {
                              return const Icon(
                                Icons.face,
                                size: 50,
                              );
                            },
                            onTap: () {},
                            animateFromOldImageOnUrlChange: true,
                            placeHolder: (context, url) {
                              return Container(
                                  child: const Center(
                                child: CircularProgressIndicator(),
                              ));
                            },
                          ),
                        ),
                        Flexible(
                            child: Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.fiber_manual_record,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 14,
                                  ),
                                  Text(
                                    "Sulaman Hassan",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on_sharp,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 14,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "ABC Road, main bullevard, near hardess, Faisalabad",
                                      style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Flexible(
                              child: Column(
                            children: [
                              Text(
                                "Status",
                                style: GoogleFonts.nunito(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Text(
                                "Online",
                                style: GoogleFonts.nunito(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[500]),
                              ),
                            ],
                          )),
                        ),
                        SizedBox(
                          height: 30,
                          width: 2,
                          child: Container(
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Flexible(
                              child: Column(
                            children: [
                              Text(
                                "User Status",
                                style: GoogleFonts.nunito(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Text(
                                "N/A",
                                style: GoogleFonts.nunito(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red[500]),
                              ),
                            ],
                          )),
                        ),
                        SizedBox(
                          height: 30,
                          width: 2,
                          child: Container(
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Flexible(
                            child: Text(
                              "Mood N/A",
                              style: GoogleFonts.nunito(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
