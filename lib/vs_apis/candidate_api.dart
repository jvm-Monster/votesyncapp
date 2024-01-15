import 'dart:convert';

import 'package:votesyncapp/vs_apis/urls.dart';
import 'package:votesyncapp/vs_models/candidate_model.dart';
import 'package:http/http.dart' as http;
class CandidateApi{

  static Future<List<Candidate>> getCandidatesApi(String schoolId,String electionType,String electionName)async{

    try {
      final response = await http.get(
        Uri.parse('${host}elections/candidates?school=$schoolId&election-type=$electionType&election-name=$electionName'),
        headers: {'Content-Type': contentType},
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        final List<Map<String, dynamic>> jsonData = List<Map<String, dynamic>>.from(json.decode(response.body));
        print(jsonData);
        List<Candidate> candidates = jsonData.map((data) => Candidate.fromJson(data)).toList();
        return candidates;
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        throw Exception('Failed to load elections');
      }
    } catch (e) {
      // Handle exceptions appropriately
      print(e);
      return []; // You might want to return an empty list or handle this case differently
    }
    return [];

  }
}