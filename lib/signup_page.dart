import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lucifer/constants.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  //final myController =
  bool _rememberMe = false;
  String _email, _password, _name;
  TextEditingController _nameCont;
  TextEditingController _emailCont;
  TextEditingController _passCont;
  DatabaseReference _ref;
  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();
  bool _success;
  String _userEmail;

  @override
  void initState() {
    super.initState();
    _nameCont = TextEditingController();
    _emailCont = TextEditingController();
    _passCont = TextEditingController();
    _ref = FirebaseDatabase.instance.reference();
  }
  @override
  void dispose() {
    _emailCont.dispose();
    _passCont.dispose();
    _nameCont.dispose();
    super.dispose();
  }

  void _register() {
    //await Firebase.initializeApp();
    _auth.createUserWithEmailAndPassword(email: _emailCont.text.trim(),password: _passCont.text.trim(),).then((_){
      _verify_user();
      Navigator.of(context).pushNamed('/login_page');
    });
  }
  Widget _buildNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _nameCont,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 14.0),
              hintText: 'Enter your Name',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            validator: (String value){
              if(value.isEmpty) {
                return 'Please enter correct email';
              }
              return null;
            },
            controller: _emailCont,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 14.0),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            validator: (String value){
              if(value.length < 6) {
                return 'Password length cannot be smaller than 6';
              }
              return null;
            },
            controller: _passCont,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 14.0),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  void pushDataFirebase() {
    Map<String, String> userEntry = {
      'Name' : _name,
      'Email' : _email,
      'Password' : _password,
    };
    _ref.push().set(userEntry);
  }

  Widget _buildSignUpBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          if(_formKey.currentState.validate()) {
            _register();
          }
          //setState(() {
          //_auth.createUserWithEmailAndPassword(email: _emailCont.text,password: _passCont.text,);
          //});
          //Navigator.of(context).pushNamed('/profile_page');
          /*setState(() {
            _name = _nameCont.text;
            _email = _emailCont.text;
            _password = _passCont.text;
            pushDataFirebase();
          });*/
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Sign Up',
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

  Widget _buildSignUpWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign up with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }


  Widget _buildSignInBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/login_page');
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign In',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _verify_user(){
    final _auth = FirebaseAuth.instance;
    User user;
    user = _auth.currentUser;
    user.sendEmailVerification();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.tealAccent[700],
                      Color(0xFF61A4F1),
                    ],
                    stops: [0.1, 0.6],
                  ),
                ),
              ),
              Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 120.0,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          //  _buildNameTF(),
                          _buildEmailTF(),
                          _buildPasswordTF(),
                          SizedBox(
                            height: 30.0,
                          ),
                          _buildSignUpBtn(),
                          //_buildSignUpWithText(),
                          _buildSignInBtn(),
                          Container(
                            alignment: Alignment.center,
                            child: Text(_success == null
                                ?''
                                :(_success
                                ? 'successfully registered ' + _userEmail
                                : 'Registration failed')),
                          )
                        ],
                      ),
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
