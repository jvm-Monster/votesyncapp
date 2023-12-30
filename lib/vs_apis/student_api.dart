import 'dart:convert';

import 'package:votesyncapp/vs_apis/election_api.dart';
import 'package:votesyncapp/vs_apis/urls.dart';
import 'package:votesyncapp/vs_models/student_model.dart';
import 'package:http/http.dart' as http;
import 'package:votesyncapp/vs_utils/api_status_codes.dart';

class StudentApi{
  static Future<Map<String,dynamic>> getStudentModel() async {
    //API endpoint
    const String apiUrl = "${host}students/220305";

    try {
      final response = await http.get(Uri.parse(apiUrl),
        headers: {
          'Content-Type':'application/json',
        }
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        final Map<String, dynamic> data = json.decode(response.body);
        print(await ElectionApi.getElections());
        return data; // Uses the fromJson method to convert the object to json
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception or handle the error as needed
        throw Exception('Failed to load student model');
      }
    } catch (error) {
      // Handle errors, e.g., network errors or timeouts
      
      throw Exception('Failed to load student model');
    }
  }


  static Future<int> createNewStudentModel(Student student) async {
    //API endpoint
    const String apiUrl = "${host}students/";
    final data = jsonEncode(student.toJson());
    try {
      final response = await http.post(
          Uri.parse(apiUrl),
          headers: {
            'Content-Type':contentType,
          },
        body: data
      );
      int resStatusCode = response.statusCode;
      if (resStatusCode == vsCreated) {
         return resStatusCode;
      } else if(resStatusCode == vsConflict){
        // If the server did not return a 200 OK response,
        // throw an exception or handle the error as needed
        /*throw Exception('Failed to load student model');*/
        return resStatusCode;
      }
      else{
        return requestTimeout;
      }
    } catch (error) {
      print(error.toString());
      // Handle errors, e.g., network errors or timeouts
      /*throw Exception('Failed to load student model');*/
      return 0;

    }
  }


}