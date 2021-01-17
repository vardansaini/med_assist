import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  Widget _buildLoginBtn1() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 160.0,
      height: 180.0,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {

        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        // color: Colors.white,
        child: Text(
          'Profile',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',

          ),textAlign: TextAlign.center,
        ),
      ),
    );
  }
  Widget _buildLoginBtn2() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 160.0,
      height: 180.0,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        // color: Colors.white,
        child: Text(
          'Medications',
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
  Widget _buildLoginBtn3() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 160.0,
      height: 180.0,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        // color: Colors.white,
        child: Text(
          '',
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
  Widget _buildLoginBtn4() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 160.0,
      height: 180.0,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        // color: Colors.white,
        child: Text(
          'Workout',
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
}