import 'file:///D:/AndroidStudioProjects/autism_project_demo_2/autism_project_demo_2/lib/widgets/Initialize_pages.dart';
import 'package:autism_project_demo_2/pages/home_page.dart';
import 'package:autism_project_demo_2/pages/order_page.dart';
import 'package:autism_project_demo_2/pages/pending_order_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routeList() {
  return {
    OrderDisplayPage.routeName: (context) => OrderDisplayPage(),
    PendingOrderPage.routeName: (context) => PendingOrderPage(),
    HomePage.routeName: (context) => HomePage(),
    Initialize.routeName: (context) => Initialize(),
  };
}
