import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableDropDown extends StatelessWidget {
  final String? hint;
  final List<String> items;
  final String? value;
  final Function(String?) onChanged;
  const ReusableDropDown({
    this.hint,
    required this.items,
    required this.onChanged,
    this.value,
    });

  @override
  Widget build(BuildContext context) {
     
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: DropdownButtonFormField(
        icon: const Icon(
          Icons.arrow_drop_down_sharp,
          size: 30,
          color: Colors.black,
        ),
        dropdownColor: Colors.white,
        autofocus: true,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent, width: 1),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 1),
          ),
        ),
        hint: Text(hint.toString(),
            style: GoogleFonts.nunito()),
        items: items
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,
               style: GoogleFonts.nunito()),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}