import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FypFormField extends StatelessWidget {
  final TextInputType keyboardType;
  final bool obscureText;
  final String PlaceholderText;
  final double PlaceholderTextSize;
  final double fontSize;
  FypFormField(
      {required this.keyboardType,
      required this.PlaceholderText,
      required this.obscureText,
      required this.fontSize,
      required this.PlaceholderTextSize});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
          textAlign: TextAlign.left,
          textInputAction: TextInputAction.none,
          obscureText: obscureText,
          autofocus: false,
          style: GoogleFonts.poppins(fontSize: fontSize, color: Colors.black87),
          keyboardType: keyboardType,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            fillColor: Colors.grey[300],
            filled: true,
            label: Text(
              PlaceholderText,
            ),
            labelStyle:
                GoogleFonts.poppins(fontSize: PlaceholderTextSize, color: Colors.black87,),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
          )),
    );
  }
}
