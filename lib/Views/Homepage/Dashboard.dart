import 'dart:ui';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sulaman_s_application007/Providers/Industries_Ideas.dart';
import 'package:sulaman_s_application007/Views/Widgets/Dashboard/dashboard_gradient_feature.dart';

import '../../Components/dashboardComponent.dart';
import '../../Models/AllIndustriesModel.dart';
import '../../Providers/Student_Provider.dart';

// class DashBoard extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//   }
// }
class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    // final dashboardProvider = Provider.of<IndustriesService>(context,listen: false);
    // dashboardProvider.industries(context);
    Provider.of<StudentService>(context, listen: false).fetchStudent();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<AllIndustries> allindustries = [];
    final dashboardProvider = Provider.of<IndustriesService>(context,listen: false);
    dashboardProvider.fetchIndustries();
     final Future<List<AllIndustries>> myFuture = dashboardProvider.fetchIndustries();

    return  SingleChildScrollView(
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
            child: FutureBuilder(
              future: myFuture,
                builder: (context,AsyncSnapshot<List<AllIndustries>>
                    snapshot){
                  if (!snapshot.hasData) {
                    return const Center(
                        child: CircularProgressIndicator());
                  } else if (snapshot.hasData &&
                      snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text(
                          'No Data found',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white),
                        ));
                  }
                  else{
                    return DashboardComponent(allindustries: snapshot.data!,);

                  }
                },
            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}