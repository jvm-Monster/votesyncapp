
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../stateproviders/school_state_providers.dart';
import '../vs_apis/school_api.dart';
import '../vs_models/school_model.dart';

class AppRequestsLoaderOnOpenApp{

  static Future<void> loadSchoolsData(WidgetRef ref) async {
    List<School>? schools = await SchoolApi.getSchools();
    ref.read(schoolListProvider.notifier).update((state) => schools);
  }




}