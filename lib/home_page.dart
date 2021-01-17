import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Widget _buildLoginBtn1() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: 160.0,
      height: 160.0,
      child: FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/profile_page');
          },
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.indigo[900],
          child: Column(children: <Widget>[
            Icon(
              Icons.person,
              size: 75,
              color: Colors.white,
            ),
            Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
          ])),
    );
  }

  Widget _buildLoginBtn2() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: 160.0,
      height: 160.0,
      child: FlatButton(
          onPressed: () { () async{
            await _auth.signOut();
          };
          Navigator.of(context).pushNamed('/login_page');
          },
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.indigo[900],
          child: Column(children: <Widget>[
            Icon(Icons.home, size: 75, color: Colors.white),
            Text(
              'Medications',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
          ])),
    );
  }

  Widget _buildLoginBtn3() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: 160.0,
      height: 160.0,
      child: FlatButton(
          onPressed: () {},
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.indigo[900],
          child: Column(
            children: <Widget>[
              Icon(Icons.home, size: 75, color: Colors.white),
              Text(
                'Medications',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildLoginBtn4() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: 160.0,
      height: 160.0,
      child: FlatButton(
          onPressed: () {},
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.indigo[900],
          child: Column(
            children: <Widget>[
              Icon(Icons.home, size: 75, color: Colors.white),
              Text(
                'Medications',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildLoginBtn5() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: 300.0,
      height: 100.0,
      child: FlatButton(
          onPressed: () {},
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.redAccent[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //Icon(Icons.home, size: 75, color: Colors.white),
              Text(
                'Emergency',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),textAlign: TextAlign.center,
              ),
            ],
          )),
    );
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
                  color: Colors.white,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.indigo[900],
                          fontFamily: 'OpenSans',
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //SizedBox(height: 20.0,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _buildLoginBtn1(),
                          Spacer(),
                          _buildLoginBtn2(),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _buildLoginBtn3(),
                          Spacer(),
                          _buildLoginBtn4(),
                        ],
                      ),
                      _buildLoginBtn5(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}