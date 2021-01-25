import 'package:autism_project_demo_2/helper/constants.dart';
import 'package:autism_project_demo_2/helper/shared_preference.dart';
import 'package:flutter/material.dart';

import 'authenticate.dart';

signOut(BuildContext context){
  SharedPrefs.saveUserJWTSharedPref("");
  SharedPrefs.saveUserLoggedInSharedPref(false);
  Constants.myToken = "";
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Authenticate()));
}