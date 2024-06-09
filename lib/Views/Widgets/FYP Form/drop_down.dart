import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sulaman_s_application007/Models/StudentModel.dart';

import '../../../Models/SupervisorModel.dart';

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




class ReusableDropDownSupervisor extends StatelessWidget {
  final String? hint;
  final List<Supervisor> items;
  final Supervisor? value;
  final Function(Supervisor?) onChanged;

  const ReusableDropDownSupervisor({
    this.hint,
    required this.items,
    required this.onChanged,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: DropdownButtonFormField<Supervisor>(
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
        hint: Text(hint ?? '',
            style: GoogleFonts.nunito()),
        value: value,
        items: items.map<DropdownMenuItem<Supervisor>>((Supervisor supervisor) {
          return DropdownMenuItem<Supervisor>(
            value: supervisor,
            child: Text('${supervisor.name}',
                style: GoogleFonts.nunito()),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}


class ReusableDropDownStudent extends StatelessWidget {
  final String? hint;
  final List<Student> items;
  final Student? value;
  final Function(Student?) onChanged;

  const ReusableDropDownStudent({
    this.hint,
    required this.items,
    required this.onChanged,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: DropdownButtonFormField<Student>(
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
        hint: Text(hint ?? '',
            style: GoogleFonts.nunito()),
        value: value,
        items: items.map<DropdownMenuItem<Student>>((Student student) {
          return DropdownMenuItem<Student>(
            value: student,
            child: Text('${student.firstName} ${student.lastName}',
                style: GoogleFonts.nunito()),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}








