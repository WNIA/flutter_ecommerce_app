import 'package:autism_project_demo_2/models/pending_order_pagination_request_model.dart';
import 'package:autism_project_demo_2/services/pending_order_api_service.dart';
import 'package:flutter/material.dart';

class PendingOrderPage extends StatefulWidget {
  @override
  _PendingOrderPageState createState() => _PendingOrderPageState();
}

class _PendingOrderPageState extends State<PendingOrderPage> {
  PendingOrderAPIService _pendingOrderAPIService = new PendingOrderAPIService();
  PendingOrderPaginationRequestModel _requestModel;

  @override
  void initState() {
    _requestModel = new PendingOrderPaginationRequestModel();
    getPendingOrderList();
    super.initState();
  }

  getPendingOrderList() async {
    _requestModel.limit = 10;
    _requestModel.page = 1;
    _requestModel.latitude = 23.7747523;
    _requestModel.longititude = 90.3654215;

    _pendingOrderAPIService.fetchPendingOrderResponse(_requestModel).then((value){
      if(value != null){
        print("...");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 1)
              ]),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 27,
                    child: Image.asset('assets/images/placeholder_image.png'),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('user name', style: TextStyle(color: Colors.grey[600])),
                      Text('+880 17XX-XXXXXX', style: TextStyle(color: Colors.grey[600])),
                      Text('useremail@email.com', style: TextStyle(color: Colors.grey[600]))
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                    child: Text('new', style: TextStyle(fontSize: 18, color: Colors.white)),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.amber[900], Colors.amber[200]]
                      )
                    ),
                  ),

                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
