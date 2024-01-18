import 'package:votesyncapp/vs_models/school_model.dart';

import 'package:votesyncapp/vs_models/school_model.dart';

class Student {
  String? studentId;
  String? studentName;
  String? studentEmail;
  String? studentPassword;
  String? studentLevel;
  School? school;

  Student(
    this.studentId,
    this.studentName,
    this.studentEmail,
    this.studentPassword,
    this.studentLevel,
    this.school,
  );

  // Convert the object to a map for encoding to JSON
  Map<String, dynamic> toJson() {
    Map<String, dynamic>? schoolMap =
        school?.toJson(); // Use ? to handle null school
    return {
      'studentId': studentId,
      'studentName': studentName,
      'studentEmail': studentEmail,
      'studentPassword': studentPassword,
      'studentLevel': studentLevel,
      'school': schoolMap,
    };
  }

  // Create a factory constructor that takes a map for decoding from JSON
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      json['studentId'],
      json['studentName'],
      json['studentEmail'],
      json['studentPassword'],
      json['studentLevel'],
      json['school'] != null
          ? School.fromJson(json['school'])
          : null, // Ensure to handle null school in JSON
    );
  }

  @override
  String toString() {
    return 'Student{studentId: $studentId, studentName: $studentName, studentEmail: $studentEmail, studentPassword: $studentPassword, studentLevel: $studentLevel, school: $school}';
  }
}
