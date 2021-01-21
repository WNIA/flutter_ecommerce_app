import 'package:autism_project_demo_2/widgets/box_deco_widget.dart';
import 'package:flutter/material.dart';

class DeliveriesPage extends StatefulWidget {
  static final routeName = "/deliveries_page";
  @override
  _DeliveriesPageState createState() => _DeliveriesPageState();
}

class _DeliveriesPageState extends State<DeliveriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deliveries'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          height: 192,
          width: double.infinity,
          decoration: boxDeco(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 27,
                        backgroundImage: AssetImage('assets/images/placeholder_image.png'),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('name',
                              style: TextStyle(color: Colors.grey[600])),
                          Text('phone no',
                              style: TextStyle(color: Colors.grey[600])),
                          Text('email',
                              style: TextStyle(color: Colors.grey[600]))
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.check_circle_outline, size: 40, color: Colors.orange[700]),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
                Divider(),
                Row(
                  children: [
                    Text("Invoice Number: ",
                        style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    Flexible(
                      child: Text('-',
                          overflow: TextOverflow.ellipsis, maxLines: 1),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Text("Delivery Charge: ",
                        style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    Flexible(
                        child: Text('-',
                            overflow: TextOverflow.ellipsis, maxLines: 1)),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Text("Order Date: ",
                        style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    Text('-'),
                  ],
                ),
                Row(
                  children: [
                    Spacer(),
                    RaisedButton(
                      onPressed: () {

                      },
                      color: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('View', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 10)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
