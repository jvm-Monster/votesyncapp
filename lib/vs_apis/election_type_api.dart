import 'dart:convert';

import 'package:votesyncapp/vs_apis/urls.dart';
import 'package:votesyncapp/vs_models/election_type_model.dart';
import 'package:http/http.dart' as http;

class ElectionTypeApi{

  
  static Future<List<ElectionType>> getElections(String? schoolId,String electionType) async {
     String baseUrl =
      '${host}elections?school-id=$schoolId&election-type=$electionType';

    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {'Content-Type': contentType}, // Assuming you are requesting JSON data
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((e) => ElectionType.fromJson(e)).toList();
      } else {
        // Handle non-200 status codes appropriately
        return [];
      }
    } catch (e) {
      // Handle exceptions appropriately
      print(e);
      return []; // You might want to return an empty list or handle this case differently
    }
  }

  static Future<List<String>> getElectionTypes()async{
    String baseUrl =
        '${host}elections/election-types';

    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {'Content-Type': contentType}, // Assuming you are requesting JSON data
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((e) => e.toString()).toList();
      } else {
        // Handle non-200 status codes appropriately
        return [];
      }
    } catch (e) {
      // Handle exceptions appropriately
      print(e);
      return []; // You might want to return an empty list or handle this case differently
    }
  }
}