import 'package:autism_project_demo_2/corner/test_pending_order_page.dart';
import 'package:autism_project_demo_2/helper/constants.dart';
import 'package:autism_project_demo_2/helper/shared_preference.dart';
import 'package:autism_project_demo_2/helper/signout.dart';
import 'package:autism_project_demo_2/pages/delivered_order_page.dart';
import 'package:flutter/material.dart';

class TestOrderDisplayPage extends StatefulWidget {
  static final routeName = '/order_page';

  @override
  _TestOrderDisplayPageState createState() => _TestOrderDisplayPageState();
}

class _TestOrderDisplayPageState extends State<TestOrderDisplayPage> {
  bool pendingSelected = true;

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  getUserInfo() async {
    Constants.myToken = await SharedPrefs.getUserJWTSharedPref();
    setState(() {});
  }

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
            tabs: [
              Tab(child: Text("Pending", )),
              Tab(child: Text("Order")),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TestPendingOrderPage(),
            DeliveredOrderPage()
          ],
        ),
      ),
    );
  }


}