import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:votesyncapp/vs_models/election_model.dart';
import 'package:votesyncapp/vs_models/election_type_model.dart';

final electionTypeProvider = StateNotifierProvider<ElectionTypeNotifier, List<ElectionType>>((ref) => ElectionTypeNotifier());

class ElectionTypeNotifier extends StateNotifier<List<ElectionType>> {
  ElectionTypeNotifier() : super([]);

  void setElections(List<ElectionType> elections) {
    state = elections;
  }

  void addElection(ElectionType election) {
    state = [...state, election];
  }

}
