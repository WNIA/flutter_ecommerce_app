import 'package:autism_project_demo_2/helper/constants.dart';
import 'package:autism_project_demo_2/helper/sign_out.dart';
import 'package:autism_project_demo_2/services/login_api_service.dart';
import 'package:autism_project_demo_2/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List userData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginAPIService>(context, listen: false);
    final _settingsData = provider.userDataList;
    return Scaffold(
      appBar: appBarMain(context, "Settings "),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: _settingsData.data != null ? Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_settingsData.data.name, style: TextStyle(color: Colors.black54)),
                      Text(_settingsData.data.mobileNumber, style: TextStyle(color: Colors.black54)),
                      Text(_settingsData.data.email, style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                ) : Container(),
              ),
              SizedBox(height: 20),
              Divider(thickness: 1),
              SizedBox(height: 10),
              Text('Account', style: TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.w400)),
              SizedBox(height: 14),
              GestureDetector(
                onTap: (){

                },
                child: Row(
                  children: [
                    Icon(Icons.account_circle_outlined, size: 50, color: Colors.black54),
                    SizedBox(width: 8),
                    Text('Profile', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              SizedBox(height: 12),
              GestureDetector(
                onTap: (){
                  
                },
                child: Row(
                  children: [
                    Icon(Icons.lock_outlined, size: 50, color: Colors.black54),
                    SizedBox(width: 8),
                    Text('Change Password', style: TextStyle(fontSize: 18)),
                  ],
                ),
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
