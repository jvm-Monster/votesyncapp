
import 'package:votesyncapp/vs_constants/vs_constants.dart';
import 'package:votesyncapp/vs_constants/vs_constants.dart';

class Election {
  String? electionEndDate;
  String? electionId;
  String? electionName;
  String? electionStartDate;
  String? electionType;
  String? electionStatus;

  Election({
     this.electionEndDate,
   this.electionId,
     this.electionName,
    this.electionStartDate,
     this.electionType,
     this.electionStatus,
  });

  // Convert the object to a map for encoding to JSON
  Map<String, dynamic> toJson() {
    return {
      'electionEndDate': electionEndDate,
      'electionId': electionId,
      'electionName': electionName,
      'electionStartDate': electionStartDate,
      'electionType': electionType,
      'electionStatus': electionStatus, // Include electionStatus in the toJson method
    };
  }

  // Create a factory constructor that takes a map for decoding from JSON
  factory Election.fromJson(Map<String, dynamic> json) {
    return Election(
      electionEndDate: json['electionEndDate']??"",
      electionId: json['electionId']??"",
      electionName: json['electionName']??"",
      electionStartDate: json['electionStartDate']??"",
      electionType: json['electionType']??"",
      electionStatus: json['electionStatus'], // Ensure to get electionStatus from JSON
    );
  }

  @override
  String toString() {
    return 'Election{electionEndDate: $electionEndDate, electionId: $electionId, electionName: $electionName, electionStartDate: $electionStartDate, electionType: $electionType, electionStatus: $electionStatus}';
  }
}

