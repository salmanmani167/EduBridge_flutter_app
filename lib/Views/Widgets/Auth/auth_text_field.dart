import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final bool obscureText;
  final String labelText;
  final IconData icon;
  final double labelSize;
  final double fontSize;
  final double iconsize;
  final TextEditingController email;
  AuthTextField(
      {required this.icon,
      required this.keyboardType,
      required this.labelText,
      required this.obscureText,
      required this.fontSize,
      required this.iconsize,
      required this.labelSize, required this.email});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.email,
        textAlign: TextAlign.start,
        textInputAction: TextInputAction.none,
        obscureText: obscureText,
        autofocus: false,
        style: GoogleFonts.poppins(fontSize: fontSize, color: Colors.black87),
        keyboardType: keyboardType,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          fillColor: Colors.grey[300],
          filled: true,
          prefixIcon: Icon(
            icon,
            size: iconsize,
          ),
          prefixIconColor: Colors.indigo[900],
          label: Text(
            labelText,
          ),
          labelStyle:
              GoogleFonts.poppins(fontSize: labelSize, color: Colors.black87),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
        ));
  }
}
