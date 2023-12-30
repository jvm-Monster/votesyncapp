import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../vs_models/student_model.dart';

class AutoLogin {
  late final SharedPreferences _autoLoginPref;

  Future<void> autoStoreDetails(Student student, bool autoLogin) async {
    _autoLoginPref = await SharedPreferences.getInstance();
      _autoLoginPref.setBool("autoLogin", autoLogin);
      _autoLoginPref.setString("autoLoginIdentity", jsonEncode(student.toJson()));
  }

  Future<Student?> autoLogin() async {
    _autoLoginPref = await SharedPreferences.getInstance();
    String? studentJson = _autoLoginPref.getString("autoLoginIdentity");

    if (studentJson != null) {
      return Student.fromJson(jsonDecode(studentJson));
    }

    return null;
  }
}
