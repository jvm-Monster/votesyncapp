import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:votesyncapp/vs_models/election_type_model.dart';

import '../vs_apis/election_type_api.dart';
import '../vs_models/election_model.dart';

final selectElectionTypeProvider = FutureProvider((ref) {
  final selectedElection = ref.watch(selectElectionProvider);
  return ElectionTypeApi.getElections('AU', selectedElection);
});

final selectElectionProvider = StateProvider((ref) => '');
final electionSelected = StateProvider<Election?>((ref) => null);

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
