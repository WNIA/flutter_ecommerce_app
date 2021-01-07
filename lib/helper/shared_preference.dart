import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{
  static String sharedPrefUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPrefUserJWTKey = "USERJWTKEY";
  static String sharedPrefUserIDKey = "USEREIDKEY";
  static String sharedPrefUserNameKey = "USERNAMEKEY";

  //TODO: catch all data from login api - @WNIA
  
  /*
   * Saving data to shared preferences
   */
  static Future<bool> saveUserLoggedInSharedPref(bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(sharedPrefUserLoggedInKey, isUserLoggedIn);
  }
  static Future<bool> saveUserJWTSharedPref(String userJWT) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPrefUserJWTKey, userJWT);
  }
  static Future<bool> saveUserIDSharedPref(int userID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setInt(sharedPrefUserIDKey, userID);
  }
  static Future<bool> saveUserNameSharedPref(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPrefUserNameKey, userName);
  }

  /*
   * Getting data from shared preferences
   */
  static Future<bool> getUserLoggedInSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(sharedPrefUserLoggedInKey);
  }
  static Future<String> getUserJWTSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPrefUserJWTKey);
  }
  static Future<int> getUserIDSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(sharedPrefUserIDKey);
  }
  static Future<String> getUserNameSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPrefUserNameKey);
  }
}