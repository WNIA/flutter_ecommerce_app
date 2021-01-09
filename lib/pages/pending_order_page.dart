import 'package:autism_project_demo_2/models/pending_order_request_model.dart';
import 'package:autism_project_demo_2/models/pending_order_response_model.dart';
import 'package:autism_project_demo_2/services/pending_order_api_service.dart';
import 'package:autism_project_demo_2/widgets/pending_order_list.dart';
import 'package:flutter/material.dart';

class PendingOrderPage extends StatefulWidget {
  @override
  _PendingOrderPageState createState() => _PendingOrderPageState();
}

class _PendingOrderPageState extends State<PendingOrderPage> {
  PendingOrderAPIService _pendingOrderAPIService = new PendingOrderAPIService();
  PendingOrderRequestModel _requestModel;

  @override
  void initState() {
    _requestModel = new PendingOrderRequestModel();
    // getPendingOrderList();

    super.initState();
  }

  /*
  * to fetch pending order list from rest api
  * @WNIA
  */
  getPendingOrderList() async {
    _requestModel.limit = 10;
    _requestModel.page = 1;
    _requestModel.latitude = 23.7747523;
    _requestModel.longititude = 90.3654215;

    _pendingOrderAPIService
        .fetchPendingOrderResponse(_requestModel)
        .then((value) {
      if (value != null) {
        print("...");
      }
    });
  }

  getPendingOrderFromJson(response) {
    try {
      if (response == null)
        return null;
      else
        return response =
            pendingOrderResponseFromJson(response.data.toString());
    } catch (e) {
      print(e);
    }
  }

  /*
   * FutureBuilder is fetching data from local json file
   */
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/json/pending_order.json'),
      builder: (context, snapshot) {
        PendingOrderResponseModel order = getPendingOrderFromJson(snapshot);
        return order != null
            ? PendingOrderList(order)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
