import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:votesyncapp/vs_models/candidate_model.dart';

final candidateStateProvider = StateProvider<List<Candidate>>((ref) => []);