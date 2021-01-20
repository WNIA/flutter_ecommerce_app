import 'dart:convert';

import 'package:autism_project_demo_2/models/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{
  static String sharedPrefUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPrefUserJWTKey = "USERJWTKEY";
  static String sharedPrefUserData = "USERDATA";

  //TODO: catch all data from login api - @WNIA

  /*
   * Saving data retrieved from login api to shared preferences
   */
  static Future<bool> saveUserLoggedInSharedPref(bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(sharedPrefUserLoggedInKey, isUserLoggedIn);
  }
  static Future<bool> saveUserJWTSharedPref(String userJWT) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPrefUserJWTKey, userJWT);
  }
  static Future<bool> saveUserDataSharedPref(Data userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = json.encode(userData.toJson());
    return await prefs.setString(sharedPrefUserData, data);
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
  static Future<String> getUserDataSharedPref() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(sharedPrefUserData);
  }
}