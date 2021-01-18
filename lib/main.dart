import 'package:autism_project_demo_2/helper/authenticate.dart';
import 'file:///D:/AndroidStudioProjects/autism_project_demo_2/autism_project_demo_2/lib/utils/route_list.dart';
import 'package:autism_project_demo_2/helper/shared_preference.dart';
import 'package:autism_project_demo_2/pages/home_page.dart';
import 'package:autism_project_demo_2/utils/provider_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userLoggedIn = false;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  /*
   * check if user is logged in - @WNIA
   */
  getLoggedInState() async {
    await SharedPrefs.getUserLoggedInSharedPref().then((value) {
      setState(() {
        userLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providerList(),
        child: MaterialApp(
            title: 'Autism Project Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              accentColor: Colors.black,
            ),
            debugShowCheckedModeBanner: false,
            home: userLoggedIn != null ? (userLoggedIn
                ? HomePage()
                : Authenticate()) : Authenticate(),
            // home: userLoggedIn != null ?(userLoggedIn ? HomePage() : Authenticate()) : Authenticate(),
            routes: routeList()
        ),
    );
  }
}
