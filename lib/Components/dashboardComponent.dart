import "package:circular_profile_avatar/circular_profile_avatar.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:sulaman_s_application007/Models/AllIndustriesModel.dart";

class DashboardComponent extends StatefulWidget {
  final List<AllIndustries> allindustries;
  const DashboardComponent({super.key, required this.allindustries});

  @override
  State<DashboardComponent> createState() => _DashboardComponentState();
}

class _DashboardComponentState extends State<DashboardComponent> {
  @override
  Widget build(BuildContext context) {
    print("widget.allindustries:${widget.allindustries}");
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: widget.allindustries.length,
        itemBuilder: (context, index) {
          final all_industries = widget.allindustries[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 50),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                          child:

                          // Image.network(all_industries.image.toString()),
                          CircularProfileAvatar(
                            all_industries.image.toString(),
                            backgroundColor: Colors.yellow,
                            borderWidth: 1,
                            borderColor: Colors.black,
                            elevation: 20,
                            radius: 40,
                            cacheImage: true,
                            errorWidget: (context, url, error) {
                              print("Below is the error :${error}");
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
                                    all_industries.title,
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
                                      all_industries.description,
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
                              all_industries.status == 1
                                  ? Text(
                                      "Online",
                                      style: GoogleFonts.nunito(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green[500]),
                                    )
                                  : Text(
                                      "Offline",
                                      style: GoogleFonts.nunito(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red[500]),
                                    ),
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
                                all_industries.author,
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
        });
  }
}
