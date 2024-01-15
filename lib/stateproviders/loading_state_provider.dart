import 'package:flutter_riverpod/flutter_riverpod.dart';

final loadingSchoolStateProvider = StateProvider<bool>((ref)=>false);
final electionTypeStateProvider = StateProvider<List<String>>((ref)=>[]);