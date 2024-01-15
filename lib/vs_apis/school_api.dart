import 'dart:convert';
import 'package:votesyncapp/vs_apis/election_api.dart';
import 'package:votesyncapp/vs_apis/urls.dart';
import 'package:votesyncapp/vs_models/school_model.dart';
import 'package:http/http.dart' as http;

class SchoolApi {
  static bool firstConnection = false;
  static Future<List<School>?> getSchools() async {
    // API endpoint
    const String apiUrl = "${host}schools/";

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(Duration(minutes: firstConnection==true?1:3));
      firstConnection = true;

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        List<dynamic> data = json.decode(response.body);
        List<School> schools = data.map((e) => School.fromJson(e)).toList();
        return schools;
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception or handle the error as needed
        /*throw Exception('Failed to load school data');*/
        return [];
      }
    } catch (error) {
      print(error);
      // Handle errors, e.g., network errors or timeouts
      /*throw Exception('Failed to load school data');*/
      return [];
    }
  }

}
