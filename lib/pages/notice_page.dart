import 'package:autism_project_demo_2/widgets/box_deco_widget.dart';
import 'package:flutter/material.dart';

class NoticePage extends StatefulWidget {
  static final routeName = "/notice_page";
  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notice'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          height: 300,
          width: double.infinity,
          decoration: boxDeco(),
        ),
      ),
    );
  }
}
