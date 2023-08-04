import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  final SharedPreferences _prefs;

  static SharedPreferencesUtils? _instance;

  SharedPreferencesUtils._(this._prefs);

  static Future<SharedPreferencesUtils> getInstance() async {
    if (_instance == null) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      _instance = SharedPreferencesUtils._(sharedPreferences);
    }
    return _instance!;
  }


  final loginKey = 'login';
  final tokenKey = 'token';

  saveLogin(String login) {
    return _prefs.setString(loginKey, login);
  }
  saveToken(String token) {
    return _prefs.setString(tokenKey, token);
  }

  getLogin() {
    return _prefs.getString(loginKey);
  }

  getToken() {
    return _prefs.getString(tokenKey);
  }

  removeLogin() {
    return _prefs.setString(loginKey, '');
  }

  removeToken() {
    return _prefs.setString(tokenKey, '');
  }
}
