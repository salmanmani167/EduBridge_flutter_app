

import 'dart:convert';

class Student {
  final int id;
  final int projectId;
  final int? studentId;
  final int superwiserId;
  final String firstName;
  final String lastName;
  final String email;
  final String? password;
  final String emailUni;
  final int status;
  final String department;
  final String? supervisor;
  final String sesstion;
  final String rollNum;
  final String? fatherName;
  final String? bloodGroup;
  final String? address;
  final String? city;
  final String? country;
  final String? postalCode;
  final String? gender;
  final String? state;
  final String? otp;
  final DateTime? otpExpiresAt;
  final DateTime emailVerifiedAt;
  final String colleagueFirstName;
  final String colleagueLastName;
  final String colleagueEmailUni;
  final String colleagueEmail;
  final String colleagueSesstion;
  final String? colleagueRollNum;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String projectTitle;

  Student({
    required this.id,
    required this.projectId,
    required this.studentId,
    required this.superwiserId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.emailUni,
    required this.status,
    required this.department,
    required this.supervisor,
    required this.sesstion,
    required this.rollNum,
    required this.fatherName,
    required this.bloodGroup,
    required this.address,
    required this.city,
    required this.country,
    required this.postalCode,
    required this.gender,
    required this.state,
    required this.otp,
    required this.otpExpiresAt,
    required this.emailVerifiedAt,
    required this.colleagueFirstName,
    required this.colleagueLastName,
    required this.colleagueEmailUni,
    required this.colleagueEmail,
    required this.colleagueSesstion,
    required this.colleagueRollNum,
    required this.createdAt,
    required this.updatedAt,
    required this.projectTitle,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      projectId: json['project_id'],
      studentId: json['student_id'],
      superwiserId: json['superwiser_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      password: json['password'],
      emailUni: json['email_uni'],
      status: json['status'],
      department: json['department'],
      supervisor: json['supervisor'],
      sesstion: json['sesstion'],
      rollNum: json['roll_num'],
      fatherName: json['father_name'],
      bloodGroup: json['blood_group'],
      address: json['address'],
      city: json['city'],
      country: json['country'],
      postalCode: json['postal_code'],
      gender: json['gender'],
      state: json['state'],
      otp: json['otp'],
      otpExpiresAt: json['otp_expires_at'] != null
          ? DateTime.parse(json['otp_expires_at'])
          : null,
      emailVerifiedAt: DateTime.parse(json['email_verified_at']),
      colleagueFirstName: json['colleague_first_name'],
      colleagueLastName: json['colleague_last_name'],
      colleagueEmailUni: json['colleague_email_uni'],
      colleagueEmail: json['colleague_email'],
      colleagueSesstion: json['colleague_sesstion'],
      colleagueRollNum: json['colleague_roll_num'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      projectTitle: json['project_title'],
    );
  }
}
List<Student> parseStudents(String responseBody) {
  final parsed = json.decode(responseBody);
  final students = parsed['data'] as List<dynamic>;
  return students.map<Student>((json) => Student.fromJson(json)).toList();
}
