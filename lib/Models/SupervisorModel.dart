// import 'dart:convert';
//
// class Supervisor {
//   final int id;
//   final String firstName;
//   final String lastName;
//   final String department;
//   final String email;
//   final int projectId;
//   final int status;
//   final int? studentId;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//
//   Supervisor({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.department,
//     required this.email,
//     required this.projectId,
//     required this.status,
//     this.studentId,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory Supervisor.fromJson(Map<String, dynamic> json) {
//     return Supervisor(
//       id: json['id'],
//       firstName: json['first_name'],
//       lastName: json['last_name'],
//       department: json['department'],
//       email: json['email'],
//       projectId: json['project_id'],
//       status: json['status'],
//       studentId: json['student_id'],
//       createdAt: DateTime.parse(json['created_at']),
//       updatedAt: DateTime.parse(json['updated_at']),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'first_name': firstName,
//       'last_name': lastName,
//       'department': department,
//       'email': email,
//       'project_id': projectId,
//       'status': status,
//       'student_id': studentId,
//       'created_at': createdAt.toIso8601String(),
//       'updated_at': updatedAt.toIso8601String(),
//     };
//   }
// }
//
// List<Supervisor> parseSupervisors(String responseBody) {
//   final parsed = json.decode(responseBody);
//   return (parsed['supervisor']['data'] as List)
//       .map<Supervisor>((json) => Supervisor.fromJson(json))
//       .toList();
// }









import 'dart:convert';

class Supervisor {
  final int id;
  final String userId;
  final String name;
  final String email;
  // final DateTime lastLogin;
  // final DateTime joinDate;
  final String phoneNumber;
  final String? status;
  final String? personalEmail;
  final String avatar;
  final String position;
  final String department;
  // final DateTime? emailVerifiedAt;
  // final DateTime createdAt;
  // final DateTime updatedAt;
  final String? address;
  final String? city;
  final String? state;
  final String? otp;
  // final DateTime? otpExpiresAt;
  final String? country;

  Supervisor({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    // required this.lastLogin,
    // required this.joinDate,
    required this.phoneNumber,
    required this.status,
    required this.personalEmail,
    required this.avatar,
    required this.position,
    required this.department,
    // required this.emailVerifiedAt,
    // required this.createdAt,
    // required this.updatedAt,
    required this.address,
    required this.city,
    required this.state,
    required this.otp,
    // required this.otpExpiresAt,
    required this.country,
  });

  factory Supervisor.fromJson(Map<String, dynamic> json) {
    return Supervisor(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      email: json['email'],
      // lastLogin: DateTime.parse(json['last_login']),
      // joinDate: DateTime.parse(json['join_date']),
      phoneNumber: json['phone_number'],
      status: json['status'],
      personalEmail: json['personal_email'],
      avatar: json['avatar'],
      position: json['position'],
      department: json['department'],
      // emailVerifiedAt: json['email_verified_at'] != null
      //     ? DateTime.parse(json['email_verified_at'])
      //     : null,
      // createdAt: DateTime.parse(json['created_at']),
      // updatedAt: DateTime.parse(json['updated_at']),
      address: json['address'],
      city: json['city'],
      state: json['state'],
      otp: json['otp'],
      // otpExpiresAt: json['otp_expires_at'] != null
      //     ? DateTime.parse(json['otp_expires_at'])
      //     : null,
      country: json['countary'],
    );
  }

}
List<Supervisor> parseSupervisors(String responseBody) {
  final parsed = json.decode(responseBody);
  final supervisors = parsed['superwisers'] as List<dynamic>;
  return supervisors.map<Supervisor>((json) => Supervisor.fromJson(json)).toList();
}