import 'package:autism_project_demo_2/corner/test_order_page.dart';
import 'package:autism_project_demo_2/pages/settings_page.dart';
import 'package:autism_project_demo_2/widgets/home_page_items.dart';
import 'package:flutter/material.dart';
class TestHome extends StatefulWidget {
  @override
  _TestHomeState createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Test Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Test Order'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Test Settings'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  List<Widget> _widgetOptions = <Widget>[
    HomePageItems(),
    TestOrderDisplayPage(),
    // Text(
    //   'Index 1: Order',
    //   // style: optionStyle,
    // ),
    SettingsPage(),
    // Text(
    //   'Index 2: Settings',
    //   // style: optionStyle,
    // ),
  ];
}
