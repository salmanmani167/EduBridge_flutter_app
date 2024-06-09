// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';
import 'package:sulaman_s_application007/Providers/Funding_Provider.dart';
import 'package:sulaman_s_application007/Providers/Industries_Ideas.dart';
import 'package:sulaman_s_application007/Providers/Messages_Provider.dart';
import 'package:sulaman_s_application007/Providers/Student_Provider.dart';
import 'package:sulaman_s_application007/Providers/Supervisor_Provider.dart';
import 'package:sulaman_s_application007/Providers/consts.dart';
import 'package:sulaman_s_application007/Views/Auth/Login.dart';
import 'package:sulaman_s_application007/Views/Auth/otp.dart';
import 'package:sulaman_s_application007/Views/Form/funding_form.dart';
import 'package:sulaman_s_application007/Views/Homepage/chat_page.dart';
import 'package:sulaman_s_application007/Views/Homepage/home_page.dart';
import 'package:sulaman_s_application007/Providers/AuthProvider.dart';
import 'package:sulaman_s_application007/Views/Form/fyp_form.dart';
import 'package:sulaman_s_application007/Views/Chat/Homepage.dart';
import 'package:sulaman_s_application007/Views/Widgets/FYP%20Form/drop_down.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:sulaman_s_application007/Providers/consts.dart';

import 'Providers/Fyp_Provider.dart';

void main() {
  runApp(EduBridge());
  Gemini.init(apiKey: GEMINI_AI_KEY,
  );
}

class EduBridge extends StatefulWidget {
  const EduBridge({super.key});

  @override
  State<EduBridge> createState() => _EduBridgeState();
}

class _EduBridgeState extends State<EduBridge> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => IndustriesService()),
        ChangeNotifierProvider(create: (_) => FypService()),
        ChangeNotifierProvider(create: (_) => SupervisorService()),
        ChangeNotifierProvider(create: (_) => StudentService()),
        ChangeNotifierProvider(create: (_) => MessagingService()),
        ChangeNotifierProvider(create: (_) => FundingService())
      ],
      child: FlutterSizer(builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Education Bridge',
          home: logIn(),
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}

// class EduBridge extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//           return MultiProvider(providers: [
//             ChangeNotifierProvider(create: (_) => Auth_Provider());
//           ]);
//
//             FlutterSizer(
//             builder: (context, orientation, screenType) {
//             return MaterialApp(
//               title: 'Education Bridge',
//               home: logIn(),
//               debugShowCheckedModeBanner: false,
//             );
//             }
//           );
//   }
// }
