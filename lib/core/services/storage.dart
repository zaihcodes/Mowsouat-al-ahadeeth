import 'package:hadeeth/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late SharedPreferences _pref;
  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  // App First Open
  static Future<void> setAppFirstOpen(bool isOpen) {
    return _pref.setBool(Constants.APP_FIRST_OPEN, isOpen);
  }

  static bool getAppFirstOpen() {
    return _pref.getBool(Constants.APP_FIRST_OPEN) ?? false;
  }
}
