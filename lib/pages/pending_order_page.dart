
import 'package:autism_project_demo_2/models/pending_order_request_model.dart';
import 'package:autism_project_demo_2/models/pending_order_response_model.dart';
import 'package:autism_project_demo_2/services/pending_order_api_service.dart';
import 'package:autism_project_demo_2/widgets/pending_order_list.dart';
import 'package:autism_project_demo_2/widgets/pending_order_list_pagination.dart';
import 'package:flutter/material.dart';
import 'package:autism_project_demo_2/services/pending_order_local_json.dart';

class PendingOrderPage extends StatefulWidget {
  @override
  _PendingOrderPageState createState() => _PendingOrderPageState();
}

class _PendingOrderPageState extends State<PendingOrderPage> {
  PendingOrderAPIService _pendingOrderAPIService = new PendingOrderAPIService();
  PendingOrderRequestModel _requestModel;
  LocalJsonService local = new LocalJsonService();

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
        future: local.fetchLocalJson(context, 1),
        builder: (context, snapshot){
          List orders = snapshot.data;
      return snapshot.hasData ? PendingOrderListPagination(orders, 1) : Center(child: CircularProgressIndicator());
    });

  }

  FutureBuilder<String> buildFutureBuilder(BuildContext context) {
    return FutureBuilder(
    future: fetchData(context, 1),
    builder: (context, snapshot) {
      PendingOrderResponseModel order = getPendingOrderFromJson(snapshot);
      return order != null
          ? PendingOrderList(order, 1)
          : Center(child: CircularProgressIndicator());
    },
  );
  }

  Future<String> fetchData(BuildContext context, int page) async {
    String response = await DefaultAssetBundle.of(context)
        .loadString('assets/json/pending_order_${page}.json');
    return response;
  }
}
