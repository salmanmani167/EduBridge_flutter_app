import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class dashboard_card extends StatefulWidget {
  final String title;
  final String author;
  final String description;
  final String status;


  const dashboard_card({super.key, required this.title, required this.author, required this.description, required this.status});

  @override
  State<dashboard_card> createState() => _dashboard_cardState();
}

class _dashboard_cardState extends State<dashboard_card> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                                  "title.toString()",
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
                                    "description.toString()",
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
                            "status" == "1"?
                            Text(
                              "Online",
                              style: GoogleFonts.nunito(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[500]),
                            ):Text(
                              "Offline",
                              style: GoogleFonts.nunito(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[500]),
                            )
                            ,
                            // Text(
                            //   "Online",
                            //   style: GoogleFonts.nunito(
                            //       fontSize: 12,
                            //       fontWeight: FontWeight.bold,
                            //       color: Colors.green[500]),
                            // ),
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
                              "Industry",
                              style: GoogleFonts.nunito(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "author.toString()",
                              style: GoogleFonts.nunito(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue),
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
    );
  }
}
