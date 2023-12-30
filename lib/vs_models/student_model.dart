import 'package:votesyncapp/vs_models/school_model.dart';

class Student {
  String? studentId;
  String? studentName;
  String? studentEmail;
  String? studentPassword;
  School? school;

  Student(this.studentId, this.studentName, this.studentEmail,this.studentPassword,this.school);

  // Convert the object to a map for encoding to JSON
  Map<String, dynamic> toJson() {
    Map<String, dynamic> schoolMap = school!.toJson();
    return {
      'studentId': studentId,
      'studentName': studentName,
      'studentEmail': studentEmail,
      'studentPassword' : studentPassword,
      'school':schoolMap
    };
  }

  // Create a factory constructor that takes a map for decoding from JSON
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      json['studentId'],
      json['studentName'],
      json['studentEmail'],
      json['studentPassword'],
      School.fromJson(json['school'])
    );
  }
}


