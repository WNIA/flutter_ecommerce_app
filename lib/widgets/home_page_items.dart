import 'package:autism_project_demo_2/helper/constants.dart';
import 'package:autism_project_demo_2/widgets/last_five_sales_chart.dart';
import 'package:flutter/material.dart';

import 'appbar_widget.dart';
import 'box_deco_widget.dart';

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
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 80,

                decoration: boxDeco(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${Constants.numOfPendingOrders}',
                            style: orderSummaryTextStyle()),
                        Text('Pending', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${Constants.numOfProcessing}',
                            style: orderSummaryTextStyle()),
                        Text('Processing',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${Constants.numOfDelivered}',
                            style: orderSummaryTextStyle()),
                        Text('Delivered', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                  height: 300,
                  width: double.infinity,
                  decoration: boxDeco(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('Last Five Sales Chart'),
                        Expanded(child: LastFiveSalesChart()),
                      ],
                    ),
                  ))
            ]),
          ),
        ));
  }

  TextStyle orderSummaryTextStyle() {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
  }
}
