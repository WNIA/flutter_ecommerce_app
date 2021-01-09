import 'package:autism_project_demo_2/pages/order_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routeList() {
  return {
    // Authenticate.routeName: (context) => Authenticate(),
    OrderDisplayPage.routeName: (context) => OrderDisplayPage()
  };
}
