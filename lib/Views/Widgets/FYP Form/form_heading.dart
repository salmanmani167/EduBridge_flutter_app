import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormHeading extends StatelessWidget {
  final String heading;
  FormHeading({required this.heading});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Text(
        heading,
        textScaleFactor: 1,
        textAlign: TextAlign.left,
        style: GoogleFonts.nunito(
            color: Colors.indigo[900],
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
