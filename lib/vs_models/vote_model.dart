import 'package:votesyncapp/vs_models/school_model.dart';
import 'package:votesyncapp/vs_models/student_model.dart';
import 'package:votesyncapp/vs_models/candidate_model.dart';
import 'package:votesyncapp/vs_models/election_model.dart';

class Vote {
  String? voteId;
  bool? voted;

  Student? student;
  School? school;

  Candidate? candidate;
  Election? election;

  Vote(this.voteId, this.voted, this.student, this.school, this.candidate,
      this.election);

  // Convert the object to a map for encoding to JSON
  Map<String, dynamic> toJson() {
    Map<String, dynamic>? schoolMap =
        school?.toJson(); // Use ? to handle null school
    Map<String, dynamic>? studentMap =
        student?.toJson(); // Use ? to handle null school
    Map<String, dynamic>? candidateMap =
        candidate?.toJson(); // Use ? to handle null school
    Map<String, dynamic>? electionMap =
        election?.toJson(); // Use ? to handle null school
    // Use ? to handle null school
    return {
      'voteId': voteId,
      'voted': voted,
      'student': studentMap,
      'school': schoolMap,
      'candidate': candidateMap,
      'election': electionMap
    };
  }

  // Create a factory constructor that takes a map for decoding from JSON
  factory Vote.fromJson(Map<String, dynamic> json) {
    return Vote(
      json['voteId'],
      json['vote'],
      json['student'] != null ? Student.fromJson(json['student']) : null,
      json['school'] != null ? School.fromJson(json['school']) : null,
      json['candidate'] != null ? Candidate.fromJson(json['candidate']) : null,
      json['election'] != null ? Election.fromJson(json['election']) : null,
    );
  }

  @override
  String toString() {
    return 'Vote{voteId: $voteId, voted: $voted, student: $student, school: $school, candidate: $candidate, election: $election}';
  }
}
