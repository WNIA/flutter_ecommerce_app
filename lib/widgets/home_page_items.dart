import 'package:autism_project_demo_2/helper/signout.dart';
import 'package:flutter/material.dart';

class HomePageItems extends StatefulWidget {
  @override
  _HomePageItemsState createState() => _HomePageItemsState();
}

class _HomePageItemsState extends State<HomePageItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
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
      ),
      // padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
      // child: Column(
      //   children: [
      //     Card(
      //       elevation: 2.0,
      //       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Column(
      //             children: [
      //               Text("Pending"),
      //               Text("${Constants.numOfPendingOrders}")
      //             ],
      //           ),
      //           Text("Processing"),
      //           Text("Delivered"),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
