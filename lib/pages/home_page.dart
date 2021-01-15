import 'package:autism_project_demo_2/helper/signout.dart';
import 'package:autism_project_demo_2/pages/order_page.dart';
import 'package:autism_project_demo_2/widgets/home_page_items.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _string = "Home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_string),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
      if(index == 0){
        _string = 'Home';
      }
      if(index == 1){
        _string = 'Order';
      }
      if(index == 2){
        _string = 'Settings';
      }
    });
  }
   List<Widget> _widgetOptions = <Widget>[
    HomePageItems(),
    OrderDisplayPage(),
    // Text(
    //   'Index 1: Business',
    //   // style: optionStyle,
    // ),
    Text(
      'Index 2: Settings',
      // style: optionStyle,
    ),
  ];
}
