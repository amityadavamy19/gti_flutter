import 'package:gti/components/constants.dart';
import 'package:gti/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:gti/components/rounded_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  bool showSpinner = false;
  //form Validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('signining in...'),
      ),
    );
  }

  void _validateInputs() async {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      setState(() {
        showSpinner = true;
      });
    } else {
      //If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
        showSpinner = false;
      });
    }
  }

  //validate Email
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

//Validate Username
  String validateName(String value) {
    if (value.length < 6)
      return 'Password must be more than six character';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                    onSaved: (String val) {
                      email = val;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter Your Email')),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  validator: validateName,
                  onSaved: (String val) {
                    password = val;
                  },
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Enter Password'),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  ButtonText: 'Log In',
                  ButtonColor: Colors.green,
                  onPressed: _validateInputs,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
