import 'dart:convert';
import 'dart:io';

import 'package:autism_project_demo_2/helper/shared_preference.dart';
import 'package:autism_project_demo_2/models/pending_order_response_model.dart';

class PendingOrderAPIService {
  Future<List> fetchPendingOrderPagination(int page) async {
    try {
      String url =
          "http://199.192.28.11/stationary/v1/get-delivery-pending-order-pagination.php";
      String token = await SharedPrefs.getUserJWTSharedPref();
      final client = HttpClient();
      final request = await client.postUrl(Uri.parse(url));
      request.headers
          .set("Content-Type", "application/json", preserveHeaderCase: true);
      request.headers
          .set("Accept", "application/json", preserveHeaderCase: true);
      request.headers.set("Authorization", token, preserveHeaderCase: true);
      request.write(
          '{"limit": 10,"page": $page,"Latitude": 23.7747523,"Longititude": 90.3654215}');
      final response = await request.close();

      PendingOrderResponseModel responseModel;
      List data = new List();

      response.transform(utf8.decoder).listen((contents) {
        responseModel = pendingOrderResponseFromJson(contents);
        int len = responseModel.data.length;
        // data.addAll(responseModel.data);
        for (int i = 0; i < len; i++) {
          data.add(responseModel.data[i].toJson());
        }
      });
      return data;
    } catch (e) {
      print(e);
    }
  }
}
