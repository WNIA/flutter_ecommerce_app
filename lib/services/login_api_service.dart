import 'package:autism_project_demo_2/models/login_request_model.dart';
import 'package:autism_project_demo_2/models/login_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginAPIService extends ChangeNotifier{
  LoginResponseModel _userData;
  LoginResponseModel get userDataList => _userData;
  String url = "http://199.192.28.11/stationary/v1/login-delivery-api.php";

  Future<LoginResponseModel> fetchLoginResponse(
      LoginRequestModel requestModel) async {
    final response =
        await http.post(url, body: loginRequestToJson(requestModel));
    if (response.statusCode == 200) {
      notifyListeners();
      _userData = loginResponseFromJson(response.body);
    } else {
      notifyListeners();
      _userData = null;
      // throw Exception('Unable to fetch Data from rest api');
    }
    return _userData;
  }
}
