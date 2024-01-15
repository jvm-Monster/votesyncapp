import 'dart:convert'; // Import this for JSON decoding
import 'package:http/http.dart' as http;
import 'package:votesyncapp/vs_apis/urls.dart';
import 'package:votesyncapp/vs_models/election_model.dart';

class ElectionApi {
  static Future<List<Election>> getElections() async {


    try {
      final response = await http.get(
        Uri.parse('${host}elections?school-id=AU&election-type=AUSA'),
        headers: {'Content-Type': contentType},
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        final List<dynamic> jsonData = json.decode(response.body);
        List<Election> elections = jsonData.map((data) => Election.fromJson(data)).toList();
        return elections;
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        throw Exception('Failed to load elections');
      }
    } catch (e) {
      // Handle exceptions appropriately
      print(e);
      return []; // You might want to return an empty list or handle this case differently
    }
  }
}
