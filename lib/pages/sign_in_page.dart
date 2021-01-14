import 'package:autism_project_demo_2/helper/shared_preference.dart';
import 'package:autism_project_demo_2/models/login_request_model.dart';
import 'package:autism_project_demo_2/pages/order_page.dart';
import 'package:autism_project_demo_2/services/login_api_service.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  final Function toggle;

  SignInScreen(this.toggle);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailControl = new TextEditingController();
  TextEditingController passwordControl = new TextEditingController();

  LoginAPIService _loginAPIService = new LoginAPIService();
  LoginRequestModel _loginRequestModel;

  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  /*
   * validators for email and password
   * @WNIA
   */
  String emailValidator(val) {
    return RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(val)
        ? null
        : "Enter valid email";
  }

  String passwordValidator(val) {
    return val.length < 6 ? "Needs 6+ characters" : null;
  }

  /*
   * TODO: forgotPasswordMethod will navigate to new page
   *  which will implement procedure to change password
   *  @WNIA
   */
  void forgotPasswordMethod() {}

  /*
   * save data in shared preference
   * send request and fetch response from login api
   * @WNIA
   */
  signInMethod() {
    if (_formKey.currentState.validate()) {
      _loginRequestModel.email = emailControl.text;
      _loginRequestModel.password = passwordControl.text;

      print(_loginRequestModel.toJson());

      setState(() {});

      _loginAPIService.fetchLoginResponse(_loginRequestModel).then((_response) {
        if (_response != null) {
          //TODO: Simplify saving data in shared preferences - @WNIA

          SharedPrefs.saveUserLoggedInSharedPref(_response.success);
          SharedPrefs.saveUserJWTSharedPref(_response.jwt);

          setState(() {});

          Navigator.pushReplacementNamed(context, OrderDisplayPage.routeName);
        }
      });
    }
  }

  // currently unused - @WNIA
  Future _showDialogBox(String title, String content) async {
    return showDialog(
        context: context,
        builder: (_) =>
            AlertDialog(title: Text(title), content: Text(content)));
  }

  @override
  void initState() {
    _loginRequestModel = new LoginRequestModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: loginItems1(context));
  }

  loginItems1(BuildContext context) {
    return Container(
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
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.center),
          Text('Sign In',
              style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          SizedBox(height: 30),
          loginForm(context),
        ],
      ),
    );
  }

  loginForm(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: emailControl,
              keyboardType: TextInputType.emailAddress,
              validator: emailValidator,
              decoration: InputDecoration(
                  labelText: 'Email Address',
                  prefixIcon: Icon(Icons.email_outlined),
                  filled: true,
                  // fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: passwordControl,
              obscureText: _obscurePassword,
              keyboardType: TextInputType.text,
              validator: passwordValidator,
              decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  filled: true,
                  // fillColor: Colors.white,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: Icon(_obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            Container(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                    onPressed: forgotPasswordMethod,
                    child: Text('Forgot Password?'))),
            Center(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 45,
                    child: RaisedButton(
                        onPressed: signInMethod,
                        color: Colors.pink,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        textColor: Colors.white,
                        child: Text('Sign In')))),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account yet?'),
                FlatButton(
                    /*
                     * toggle function navigates to Sign Up page
                     * @WNIA
                    */
                    onPressed: () {
                      widget.toggle();
                    },
                    child: Text('Register'))
              ],
            )
          ],
        ));
  }
}
