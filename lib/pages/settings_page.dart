import 'package:autism_project_demo_2/helper/constants.dart';
import 'package:autism_project_demo_2/helper/sign_out.dart';
import 'package:autism_project_demo_2/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context, "Settings "),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Constants.dataOfUser != null ? Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Constants.dataOfUser["Name"], style: TextStyle(color: Colors.black54)),
                      Text(Constants.dataOfUser["MobileNumber"], style: TextStyle(color: Colors.black54)),
                      Text(Constants.dataOfUser["Email"], style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                ) : Container(),
              ),
              SizedBox(height: 20),
              Divider(thickness: 1),
              SizedBox(height: 10),
              Text('Account', style: TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.w400)),
              SizedBox(height: 14),
              Row(
                children: [
                  Icon(Icons.account_circle_outlined, size: 50, color: Colors.black54),
                  SizedBox(width: 8),
                  Text('Profile', style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.lock_outlined, size: 50, color: Colors.black54),
                  SizedBox(width: 8),
                  Text('Change Password', style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(height: 12),
              GestureDetector(
                onTap: (){
                  signOut(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.logout, size: 50, color: Colors.black54),
                    SizedBox(width: 8),
                    Text('Logout', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Divider(thickness: 1),
              SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.help_outline_outlined, size: 50, color: Colors.black54),
                  SizedBox(width: 8),
                  Text('Help', style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.policy_outlined, size: 50, color: Colors.black54),
                  SizedBox(width: 8),
                  Text('Policy', style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(height: 12),
              Divider(thickness: 1)
            ],
          ),
        ),
      ),
    );
  }
}
