import 'package:autism_project_demo_2/models/pending_order_response_model.dart';
import 'package:flutter/material.dart';

class PendingOrderList extends StatelessWidget {
  final PendingOrderResponseModel pendingOrderData;

  PendingOrderList(this.pendingOrderData);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: pendingOrderData.data.length,
            itemBuilder: (BuildContext context, int index) {
              return pendingOrderListItem(index, pendingOrderData);
            }));
  }

  pendingOrderListItem(int index, PendingOrderResponseModel orders) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        height: 188,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 1)
            ]),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 27,
                    backgroundImage: orders.data[index].picture == null
                        ? AssetImage('assets/images/placeholder_image.png')
                        : NetworkImage(orders.data[index].picture),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(orders.data[index].name,
                          style: TextStyle(color: Colors.grey[600])),
                      Text(orders.data[index].mobileNumber,
                          style: TextStyle(color: Colors.grey[600])),
                      Text(orders.data[index].email,
                          style: TextStyle(color: Colors.grey[600]))
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                    child: Text('new',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.amber[900], Colors.amber[200]])),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text("Address: ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Flexible(child: Text(orders.data[index].orderAddress, overflow: TextOverflow.ellipsis, maxLines: 1)),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Text("Area: ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(orders.data[index].orderArea),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Text("Order Date: ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(
                      "${orders.data[index].created.day}/${orders.data[index].created.month}/${orders.data[index].created.year}"),
                ],
              ),
              Row(
                children: [
                  Spacer(),
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.lightBlue,
                    child: Text('View', style: TextStyle(color: Colors.white)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(width: 10)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
