
import 'package:votesyncapp/vs_models/election_model.dart';

class ElectionType {
  String electionType;
  List<Election> elections;

  ElectionType({
    required this.electionType,
    required this.elections,
  });

  factory ElectionType.fromJson(Map<String, dynamic> json) => ElectionType(
        electionType: json['electionType'],
        elections: List<Election>.from(
            json['elections'].map((x) => Election.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'electionType': electionType,
        'elections': List<dynamic>.from(elections.map((x) => x.toJson())),
      };
}

 
