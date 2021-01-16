import 'package:autism_project_demo_2/helper/authenticate.dart';
import 'package:autism_project_demo_2/helper/constants.dart';
import 'package:autism_project_demo_2/helper/shared_preference.dart';
import 'package:autism_project_demo_2/helper/signout.dart';
import 'package:autism_project_demo_2/pages/delivered_order_page.dart';
import 'package:autism_project_demo_2/pages/pending_order_page.dart';
import 'package:flutter/material.dart';

class OrderDisplayPage extends StatefulWidget {
  static final routeName = '/order_page';

  @override
  _OrderDisplayPageState createState() =>
      _OrderDisplayPageState();
}

class _OrderDisplayPageState extends State<OrderDisplayPage> {
  bool pendingSelected = true;


  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    Constants.myToken = await SharedPrefs.getUserJWTSharedPref();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  pendingSelected = true;
                });
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 50,
                  color: pendingSelected ? Color(0xffeceff1) : Colors.white,
                  child: Center(
                      child: Text("Pending",
                          style: TextStyle(
                              fontSize: 16,
                              color: pendingSelected
                                  ? Colors.black
                                  : Colors.grey)))),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  pendingSelected = false;
                });
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 50,
                  color: !pendingSelected ? Color(0xffeceff1) : Colors.white,
                  child: Center(
                      child: Text("Delivered",
                          style: TextStyle(
                              fontSize: 16,
                              color: !pendingSelected
                                  ? Colors.black
                                  : Colors.grey)))),
            ),
          ],
        ),
        pendingSelected ? PendingOrderPage() : DeliveredOrderPage()
      ],
    );
  }
}
