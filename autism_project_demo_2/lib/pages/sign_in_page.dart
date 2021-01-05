import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  final Function toggle;

  SignInScreen(this.toggle);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 30),
            child: Image(
              image: AssetImage('assets/images/butterfly1.jpg'),
              height: 100,
              width: 100,
            ),
          ),
            Text('Welcome!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Text('Sign In',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center),
            SizedBox(height: 30),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email Address',
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      obscureText: _obscurePassword,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    Container(alignment: Alignment.bottomRight, child: FlatButton(onPressed: (){}, child: Text('Forgot Password?'))),
                    Center(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: RaisedButton(
                                onPressed: () {},
                                color: Colors.amber,
                                textColor: Colors.white,
                                child: Text('Sign In')))),
                    SizedBox(height: 10),
                    Center(child: Text('Don\'t have an account yet?')),
                    Center(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: RaisedButton(
                                onPressed: () {
                                  widget.toggle();
                                },
                                color: Colors.amber,
                                textColor: Colors.white,
                                child: Text('Register'))))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
