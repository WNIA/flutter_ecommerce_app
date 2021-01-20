import 'package:autism_project_demo_2/helper/constants.dart';
import 'package:flutter/material.dart';

import 'appbar_widget.dart';

class HomePageItems extends StatefulWidget {
  @override
  _HomePageItemsState createState() => _HomePageItemsState();
}

class _HomePageItemsState extends State<HomePageItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context, "Home"),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(color: Colors.blue[50], blurRadius: 2, spreadRadius: 1)
                ]
            ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${Constants.numOfPendingOrders}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text('Pending', style: TextStyle(color: Colors.grey)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${Constants.numOfProcessing}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text('Processing', style: TextStyle(color: Colors.grey)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${Constants.numOfDelivered}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text('Delivered', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
