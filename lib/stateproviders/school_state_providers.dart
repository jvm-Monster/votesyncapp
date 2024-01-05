import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../vs_models/school_model.dart';
final schoolListProvider = StateProvider<List<School>?>((ref)=>[]);