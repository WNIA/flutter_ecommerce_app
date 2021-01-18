import 'package:autism_project_demo_2/helper/signout.dart';
import 'package:autism_project_demo_2/pages/delivered_order_page.dart';
import 'package:autism_project_demo_2/pages/pending_order_page.dart';
import 'package:flutter/material.dart';

class OrderDisplayPage extends StatefulWidget {
  static final routeName = '/order_page';

  @override
  _OrderDisplayPageState createState() => _OrderDisplayPageState();
}

class _OrderDisplayPageState extends State<OrderDisplayPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Order"),
          actions: [
            GestureDetector(
              onTap: () {
                signOut(context);
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.exit_to_app)),
            )
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(child: Text("PENDING", style: TextStyle(fontWeight: FontWeight.bold))),
              Tab(child: Text("DELIVERY", style: TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PendingOrderPage(),
            DeliveredOrderPage()
          ],
        ),
      ),
    );
  }
}
