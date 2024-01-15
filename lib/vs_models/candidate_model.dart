import 'package:votesyncapp/vs_models/election_model.dart';
import 'package:votesyncapp/vs_models/school_model.dart';
import 'package:votesyncapp/vs_models/student_model.dart';

import 'package:votesyncapp/vs_models/election_model.dart';
import 'package:votesyncapp/vs_models/school_model.dart';
import 'package:votesyncapp/vs_models/student_model.dart';

class Candidate {
  int candidateId;
  Election? election; // Use nullable types for properties that can be null
  Student? student;

  Candidate({
    required this.candidateId,
    this.election,
    this.student,
  });

  Map<String, dynamic> toJson() {
    return {
      'candidateId': candidateId,
      'election': election?.toJson(), // Use ?.toJson() to handle null gracefully
      'student': student?.toJson(), // Use ?.toJson() to handle null gracefully
    };
  }

  // Create a factory constructor that takes a map for decoding from JSON
  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      candidateId: json['candidateId'],
      election: json['election'] != null
          ? Election.fromJson(json['election'])
          : null, // Check for null in the JSON data
      student: json['student'] != null
          ? Student.fromJson(json['student'])
          : null, // Check for null in the JSON data
    );
  }
}
