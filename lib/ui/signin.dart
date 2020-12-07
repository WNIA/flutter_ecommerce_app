import 'package:flutter/material.dart';
import 'package:flutter_app/ui/signup.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<SignInScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                imageAtTop(),
                welcomeText(),
                subText1(),
                nameField(nameController),
                passwordField(passwordController),
                forgotPasswordButton(),
                submitButton(nameController, passwordController),
                subText2(),
                fgButton(),
                signupPage(context),
              ],
            )));
  }
}
Widget imageAtTop(){
  return new Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 20),
      child: Image(
        image: AssetImage('assets/images/butterfly.jpg'),
        height: 100,
        width: 100,
      )
  );
}
Widget welcomeText(){
  return new Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0.0),
      child: Text(
        'Welcome!',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 30),
      ));
}
Widget subText1(){
  return new Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(10,10,10,0),
      child: Text(
        'Log in to your existing account',
        style: TextStyle(
            color: Colors.grey[500],
            fontSize: 15
        ),
      ));
}
Widget nameField(nameController){
  return new  Container(
    padding: EdgeInsets.fromLTRB(10,10,10,0),
    // height: 50,
    child: TextField(
      controller: nameController,
      decoration: InputDecoration(
        /*border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),*/
        labelText: 'User Name',
          prefixIcon: Icon(Icons.account_circle_rounded),
      ),
    ),
  );
}
Widget passwordField(passwordController){
  return new Container(
    padding: EdgeInsets.fromLTRB(10,10,10,0),
    // height: 50,
    child: TextField(
      obscureText: true,
      controller: passwordController,
      decoration: InputDecoration(
        /*border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),*/
        labelText: 'Password',
          prefixIcon: Icon(Icons.lock)
      ),
    ),
  );
}
Widget forgotPasswordButton(){
  return new FlatButton(
    onPressed: (){
      //forgot password screen
    },
    textColor: Colors.black,
    child: Text('Forgot Password?'),
  );
}
Widget submitButton(nameController, passwordController){
  return new Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: SizedBox(
          height: 50,
          width: 100,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        textColor: Colors.white,
        color: Colors.pink,
        child: Text('Login'),
        onPressed: () {
          //print(nameController.text);
          //print(passwordController.text);
        },
      )));
}
Widget subText2(){
  return new Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(top: 10),
    child: Text(
      'Or connect using',
      style: TextStyle(
        color: Colors.grey[500]
      ),
    ),
  );
}
Widget fgButton(){
  return new Container(
    child: Row(
      children: <Widget>[
        FlatButton(
            onPressed: (){},
            textColor: Colors.white,
            color: Colors.blue[700],
            child: Text('Facebook'),
        ),
        SizedBox(width: 5),
        FlatButton(
            onPressed: (){},
            textColor: Colors.white,
            color: Colors.red,
            child: Text('Google'),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    ),
  );
}
Widget signupPage(context){
  return new  Container(
      child: Row(
        children: <Widget>[
          Text('Don\'t have an account?'),
          FlatButton(
            textColor: Colors.blue,
            child: Text(
              'Sign Up',
              style: TextStyle(fontSize: 15),
            ),
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage()),
              );
            },
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ));
}
