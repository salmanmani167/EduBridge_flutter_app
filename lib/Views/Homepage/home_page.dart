
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:getwidget/components/drawer/gf_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sulaman_s_application007/Views/Form/funding_form.dart';
import 'package:sulaman_s_application007/Views/Homepage/Dashboard.dart';
import 'package:sulaman_s_application007/Views/Form/fyp_form.dart';
import 'package:sulaman_s_application007/Views/Homepage/chat_page.dart';
import 'package:sulaman_s_application007/Views/Widgets/Homepage/drawer_list_tile.dart';

import '../Chat/Homepage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Defining a golbal key(_homepagekey) to access the drawer functionality , and we cannot access this key outside the class in which we have defined it
  // and if we add underscore(_) before a variable then it becomes a private variable i.e. _homepagekey
  final GlobalKey<ScaffoldState> _homepagekey = GlobalKey();

  List<IconData> iconslist = [
    FontAwesomeIcons.circleUser,
    FontAwesomeIcons.windows,
    FontAwesomeIcons.moneyBill,
    FontAwesomeIcons.message
  ];

  int page = 1;
  int Pageview = 1;
  PageController pageController = PageController(initialPage: 1);

// it's a function that return a widget(used to render the page)
  Widget pageviewsection() {
    return PageView(
      controller: pageController,
      onPageChanged: (value) {
        setState(
          () {
            print(value);
          },
        );
      },
      children: [
       FypForm(),
        DashBoard(),
       FundingForm(),
        GemeniPage(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homepagekey,
      appBar: AppBar(
        title: Text(
          "Education Bridge",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.indigo[900],
        centerTitle: true,
        actions: [
          Container(
            width: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatPage()),
              );
              },
              child: Image.asset(
                "assets/dashboard/chatting.png",
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.grey[300],
        icons: iconslist,
        activeIndex: page,
        activeColor: Colors.indigo[900],
        inactiveColor: Colors.grey[900],
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.smoothEdge,
        // leftCornerRadius: 32,
        // rightCornerRadius: 32,
        gapLocation: GapLocation.none,
        onTap: (p0) {
          setState(() {
            Pageview = p0;
            pageController.animateToPage(p0,
                duration: Duration(milliseconds: 200), curve: Curves.linear);
          });
        },
      ),
      body: pageviewsection(),
    );
  }
}
