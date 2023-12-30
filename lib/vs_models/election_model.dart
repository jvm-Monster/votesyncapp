import 'package:votesyncapp/vs_models/school_model.dart';

class Election {
  String electionEndDate;
  String electionId;
  String electionName;
  String electionStartDate;
  String electionType;

  Election({
    required this.electionEndDate,
    required this.electionId,
    required this.electionName,
    required this.electionStartDate,
    required this.electionType,
  });

  // Convert the object to a map for encoding to JSON
  Map<String, dynamic> toJson() {
    return {
      'electionEndDate': electionEndDate,
      'electionId': electionId,
      'electionName': electionName,
      'electionStartDate': electionStartDate,
      'electionType': electionType,
    };
  }

  // Create a factory constructor that takes a map for decoding from JSON
  factory Election.fromJson(Map<String, dynamic> json) {
    return Election(
      electionEndDate: json['electionEndDate'],
      electionId: json['electionId'],
      electionName: json['electionName'],
      electionStartDate: json['electionStartDate'],
      electionType: json['electionType'],
    );
  }


}
