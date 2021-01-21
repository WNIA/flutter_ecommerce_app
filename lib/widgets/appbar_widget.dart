import 'package:autism_project_demo_2/pages/deliveries_page.dart';
import 'package:autism_project_demo_2/pages/notice_page.dart';
import 'package:flutter/material.dart';

AppBar appBarMain(BuildContext context, String titleText) {
  return AppBar(
    title: Text(titleText),
    actions: [
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, DeliveriesPage.routeName);
        },
        child: Icon(Icons.credit_card),
      ),
      SizedBox(width: 8),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, NoticePage.routeName);
        },
        child: Icon(Icons.notifications),
      ),
      SizedBox(width: 10),
    ],
  );
}

AppBar appBarOrderPage(BuildContext context) {
  return AppBar(
    title: Text("Order"),
    actions: [
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, DeliveriesPage.routeName);
        },
        child: Icon(Icons.credit_card),
      ),
      SizedBox(width: 8),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, NoticePage.routeName);
        },
        child: Icon(Icons.notifications),
      ),
      SizedBox(width: 10),
    ],
    bottom: TabBar(
      indicatorColor: Colors.white,
      tabs: [
        Tab(
            child:
                Text("PENDING", style: TextStyle(fontWeight: FontWeight.bold))),
        Tab(
            child: Text("DELIVERY",
                style: TextStyle(fontWeight: FontWeight.bold))),
      ],
    ),
  );
}
