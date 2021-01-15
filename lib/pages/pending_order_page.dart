import 'package:autism_project_demo_2/services/pending_order_api_service.dart';
import 'package:autism_project_demo_2/widgets/pending_order_list_pagination.dart';
import 'package:flutter/material.dart';
import 'package:autism_project_demo_2/services/pending_order_local_json.dart';

class PendingOrderPage extends StatefulWidget {
  static final routeName = '/pending_order_page';
  @override
  _PendingOrderPageState createState() => _PendingOrderPageState();
}

class _PendingOrderPageState extends State<PendingOrderPage> {
  LocalJsonService local = new LocalJsonService();
  PendingOrderAPIService _apiService = new PendingOrderAPIService();

  @override
  void initState() {
    super.initState();
  }


  /*
   * FutureBuilder is fetching data from local json file
   */
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _apiService.fetchPendingOrderPagination(1),
        builder: (context, snapshot) {
          List orders = snapshot.data;
          return snapshot.hasData
              ? PendingOrderListPagination(orders, 1)
              : Center(child: CircularProgressIndicator());
        });
  }
}
