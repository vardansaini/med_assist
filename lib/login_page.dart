import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucifer/constants.dart';

class LoginPage extends StatefulWidget{
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>{
  final _phoneCont = TextEditingController();
  final _codeCont = TextEditingController();
  String _phone, _code;

  Future<void> signIn(String phone, BuildContext context) async{
    final FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(phoneNumber:phone, timeout: Duration(seconds: 100),
        verificationCompleted: (AuthCredential credential) async{
      Navigator.of(context).pop();
          UserCredential authResult = await _auth.signInWithCredential(credential);
          User user = authResult.user;
          if(user != null){
            Navigator.of(context).pushNamed('/home_page');
          }
        }, verificationFailed: (FirebaseAuthException e){
          print(e);
        }, codeSent: (String verificationId, [int forceResendingToken]){
          showDialog(context: context,
              barrierDismissible: false,
              builder: (context){
                return AlertDialog(
                  title: Text("Give The Code"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        controller: _codeCont,
                      )
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(onPressed: () async {
                      AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId,
                          smsCode: _codeCont.text.trim());
                      UserCredential authResult = await _auth.signInWithCredential(credential);
                      User user = authResult.user;
                      if(user != null){
                        Navigator.of(context).pushNamed('/home_page');
                      }
                      else{
                        print("Error");
                      }
                    }, child: Text("Confirm"))
                  ],
                );
              });
        }, codeAutoRetrievalTimeout: (String verificationId){});
  }
  Widget _phoneTextBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            validator: (input){
              if(input.isEmpty) {
                return 'Please provide a correct Phone No';
              }
              return null;
            },
            //onSaved: (input) => _email = input,
            keyboardType: TextInputType.phone,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.phone,
                color: Colors.white,
              ),
              hintText: 'Enter your Phone No',
              hintStyle: kHintTextStyle,
            ),
            controller: _phoneCont,
          ),
        ),
      ],
    );
  }
  Widget _loginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          setState(() {
            _phone = _phoneCont.text;
          });
          signIn(_phone, context);
          print(_phoneCont.text);
          // signIn(_phoneCont.text.trim(), context);
          //final  user = await _auth.currentUser();
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _phoneTextBox(),
        _loginBtn(),
        Text("$_phone"),
      ],
    ),);
  }
}