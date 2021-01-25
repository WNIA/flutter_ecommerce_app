import 'package:autism_project_demo_2/pages/Initialize_page.dart';
import 'package:autism_project_demo_2/pages/change_password_page.dart';
import 'package:autism_project_demo_2/pages/finished_deliveries_page.dart';
import 'package:autism_project_demo_2/pages/home_page.dart';
import 'package:autism_project_demo_2/pages/notice_page.dart';
import 'package:autism_project_demo_2/pages/pending_order_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routeList() {
  return {
    PendingOrderPage.routeName: (context) => PendingOrderPage(),
    HomePage.routeName: (context) => HomePage(),
    Initialize.routeName: (context) => Initialize(),
    FinishedDeliveriesPage.routeName: (context) => FinishedDeliveriesPage(),
    NoticePage.routeName: (context) => NoticePage(),
    ChangePasswordPage.routeName: (context) => ChangePasswordPage(),
  };
}
