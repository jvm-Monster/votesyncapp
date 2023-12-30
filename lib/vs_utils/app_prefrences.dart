import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  late final SharedPreferences _appPreferences;

  AppPreferences() {
    _initPreferences();
  }

  Future<void> _initPreferences() async {
    _appPreferences = await SharedPreferences.getInstance();
  }

  // Theme Mode
  Future<void> setThemeMode(bool lightOrDark) async {
    await _initPreferences();
    _appPreferences.setBool("appThemeMode", lightOrDark);
  }

  Future<bool?> getThemeMode() async {
    await _initPreferences();
    return _appPreferences.getBool("appThemeMode");
  }

  // Notification
  Future<void> setNotificationStatus(bool onNotification) async {
    await _initPreferences();
    _appPreferences.setBool("onNotification", onNotification);
  }

  Future<bool?> getNotificationStatus() async {
    await _initPreferences();
    return _appPreferences.getBool("onNotification");
  }
}
