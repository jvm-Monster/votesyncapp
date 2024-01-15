import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:votesyncapp/vs_models/election_model.dart';

final electionListProvider = StateNotifierProvider<ElectionListNotifier, List<Election>>((ref) => ElectionListNotifier());
final studentVotesProvider = StateProvider((ref) => {});

class ElectionListNotifier extends StateNotifier<List<Election>> {
  ElectionListNotifier() : super([]);

  void setElections(List<Election> elections) {
    state = elections;
  }

  void addElection(Election election) {
    state = [...state, election];
  }

  void removeElection(Election election) {
    state = state.where((e) => e.electionId != election.electionId).toList();
  }
}
