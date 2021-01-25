import 'package:autism_project_demo_2/helper/constants.dart';
import 'package:autism_project_demo_2/services/processed_deliveries_list_api_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'box_deco_widget.dart';

class ProcessedDeliveryListItems extends StatefulWidget {
  int orderId;

  ProcessedDeliveryListItems(this.orderId);

  @override
  _ProcessedDeliveryListItemsState createState() =>
      _ProcessedDeliveryListItemsState();
}

class _ProcessedDeliveryListItemsState
    extends State<ProcessedDeliveryListItems> {
  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<ProcessedDeliveriesListAPIService>(context, listen: false);
    return FutureBuilder(
        future: provider.fetchProcessedDeliveriesList(
            Constants.myToken, widget.orderId),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? processedDeliveriesListViewBuilder(snapshot.data)
              : Container(height: 200,);
        });
  }

  processedDeliveriesListViewBuilder(List data) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return processedDeliveriesListItem(context, index, data);
        });
  }

  processedDeliveriesListItem(
      BuildContext context, int index, List data) {
    DateTime date = DateTime.parse(data[index]['Created']);
    String format = DateFormat('dd/MM/yyyy').format(date);
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Container(
            height: 230,
            width: 220,
            decoration: boxDeco(),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0)),
                      child: Image.network(data[index]["Picture"], height: 150, width: double.infinity),
                    ),
                    Positioned(
                      top: 50,
                        right: 0,
                        child: Container(
                            padding: const EdgeInsets.all(5.0),
                            color: Colors.pink,
                            child: Text(format,
                                style:
                                    TextStyle(fontSize: 12, color: Colors.white)))),
                    Positioned(
                        left: 0,
                        top: 20,
                        child: Container(
                            padding: const EdgeInsets.all(5.0),
                            color: Colors.pink,
                            child: Text('Price: ${data[index]["Price"]} ৳',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.white)))),
                    Positioned(
                        left: 0,
                        bottom: 10,
                        child: Container(
                            padding: const EdgeInsets.all(5.0),
                            color: Colors.grey[200].withOpacity(0.5),
                            child: Text(data[index]["Name"], style: TextStyle(fontSize: 12)))),
                  ],
                ),
                SizedBox(height: 5),
                FlatButton(
                    onPressed: () {},
                    child: Text('Cancel', style: TextStyle(color: Colors.white)),
                    color: Colors.black),
                Text('1')
              ],
            )),
      ),
    );
  }
}
