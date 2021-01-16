import 'package:autism_project_demo_2/helper/constants.dart';
import 'package:autism_project_demo_2/helper/shared_preference.dart';
import 'package:autism_project_demo_2/pages/order_page.dart';
import 'package:autism_project_demo_2/pages/settings_page.dart';
import 'package:autism_project_demo_2/widgets/home_page_items.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  static final routeName = '/home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  /*Saving token in constant variable*/
  getUserInfo() async {
    Constants.myToken = await SharedPrefs.getUserJWTSharedPref();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
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
    OrderDisplayPage(),
    SettingsPage(),
  ];
}
