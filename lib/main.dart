// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';
import 'package:sulaman_s_application007/Views/Auth/Login.dart';
import 'package:sulaman_s_application007/Views/Auth/otp.dart';
import 'package:sulaman_s_application007/Views/Form/funding_form.dart';
import 'package:sulaman_s_application007/Views/Homepage/chat_page.dart';
import 'package:sulaman_s_application007/Views/Homepage/home_page.dart';
import 'package:sulaman_s_application007/Providers/AuthProvider.dart';
import 'package:sulaman_s_application007/Views/Form/fyp_form.dart';
import 'package:sulaman_s_application007/Views/Widgets/FYP%20Form/drop_down.dart';

void main() {
  runApp(EduBridge());
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
