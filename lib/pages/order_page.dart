import 'package:autism_project_demo_2/pages/processed_deliveries_page.dart';
import 'package:autism_project_demo_2/pages/pending_order_page.dart';
import 'package:autism_project_demo_2/widgets/appbar_widget.dart';
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
        appBar: appBarOrderPage(context),
        body: TabBarView(
          children: [
            PendingOrderPage(),
            ProcessedDeliveriesPage()
          ],
        ),
      ),
    );
  }

}
