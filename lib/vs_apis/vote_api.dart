import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:votesyncapp/vs_apis/urls.dart';

import '../vs_models/vote_model.dart';
import '../vs_utils/api_status_codes.dart';

class VoteApi {
  static Future<Map> getStudentVotes(String studentId, String schoolId,
      String electionType, String electionName) async {
    //API endpoint
    String apiUrl =
        "${host}votes/student-votes?student-id=$studentId&school-id=$schoolId&election-type=$electionType&election-name=$electionName";

    try {
      final response = await http.get(Uri.parse(apiUrl), headers: {
        'Content-Type': 'application/json',
      });

      print(response.body);
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        final Map data = json.decode(response.body);
        print(data);
        print("Printing object heree");
        return data; // Uses the fromJson method to convert the object to json
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception or handle the error as needed
        throw Exception('Didnt work');
      }
    } catch (error) {
      // Handle errors, e.g., network errors or timeouts
      print(error);
      print("Eror ror ror ror ror ");
      return {};
    }
  }

  static Future<bool> voteCandidate(Vote vote) async {

    String apiUrl = "${host}votes/";
    final data = jsonEncode({
      "voteId":vote.voteId,
      "voted":vote.voted,
      "student":{
        "studentId":vote.student!.studentId
      },
      "school":{
        "schoolId":vote.school!.schoolId
      },
      "candidate":{
        "candidateId":vote.candidate!.candidateId
      },
      "election":{
        "electionId":vote.election!.electionId
      }
    });


    try {
      final response = await http.post(Uri.parse(apiUrl),
          headers: {'Content-Type': contentType}, body: data);

      int resStatusCode = response.statusCode;
      if (resStatusCode == vsCreated) {
        return true;
      } else if (resStatusCode == vsConflict) {
        // If the server did not return a 200 OK response,
        // throw an exception or handle the error as needed
        /*throw Exception('Failed to load student model');*/
        return false;
      } else {
        return false;
      }
    } catch (e) {
      print('this is an error from the vote api : $e');
      return false;
    }
  }
}
