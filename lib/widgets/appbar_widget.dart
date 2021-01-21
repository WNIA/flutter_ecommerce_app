import 'package:flutter/material.dart';

AppBar appBarMain(BuildContext context, String titleText) {
  return AppBar(
    title: Text(titleText),
    actions: [
      GestureDetector(
        onTap: () {

        },
        child: Icon(Icons.credit_card),
      ),
      SizedBox(width: 8),
      GestureDetector(
        onTap: (){

        },
        child: Icon(Icons.notifications),
      ),
      SizedBox(width: 10),
    ],
  );
}
