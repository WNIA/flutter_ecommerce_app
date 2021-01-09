import 'dart:convert';

import 'package:autism_project_demo_2/models/pending_order_request_model.dart';
import 'package:autism_project_demo_2/models/pending_order_response_model.dart';
import 'package:http/http.dart' as http;

class PendingOrderAPIService {
  Map<String, String> getHeaders() {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization":
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJsb2NhbGhvc3QiLCJpYXQiOjE2MTAwMTYyMzMsIm5iZiI6MTYxMDAxNjI0MywiZXhwIjoxNjQxMTIwMjMzLCJhdWQiOiJteXVzZXJzIiwiZGF0YSI6eyJJZCI6MiwiTmFtZSI6Ik1kIFNhaWZ1bCBJc2xhbSIsIkVtYWlsIjoiZXZhbmtoYW4xMDBAaG90bWFpbC5jb20ifX0.t0nN1upqJumKxeCwKO_yaoRKgyiXHRUgXotPLc3-h6xBKdOjkTVxm2jubiK6BUWAMRvszcPrWVdHovTHqNBGnw"
    };
  }

  Future<PendingOrderResponseModel> fetchPendingOrderResponse(
      PendingOrderRequestModel requestModel) async {
    String url =
        'http://199.192.28.11/stationary/v1/get-delivery-pending-order-pagination.php/';
    try {
      final response = await http.post(url,
          body: json.encode(requestModel), headers: getHeaders());
      print(response.statusCode);
    } catch (err) {
      print(err);
    }
  }
}
