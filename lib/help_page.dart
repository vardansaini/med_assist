import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HelpPage extends StatefulWidget {
  @override
  HelpPageState createState() => HelpPageState();
}

class HelpPageState extends State<HelpPage> {
  Widget _buildLoginBtn1() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: 330.0,
      height: 80.0,
      child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed('/profileSetUp');

          },
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.tealAccent[700],
          child: Text(
            'I need help!',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),

      ),
    );
  }
  Widget _buildLoginBtn2() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: 330.0,
      height: 80.0,
      child: RaisedButton(
        onPressed: () {
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.tealAccent[700],
        child: Text(
          'I want to volunteer!',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),

      ),
    );
  }

  Widget _buildImage() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      //width: 330.0,
      //height: 80.0,
      child: Image(image: AssetImage('assets/l.png'),
      ),
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
                      /*Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.redAccent[200],
                          fontFamily: 'OpenSans',
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),*/
                      _buildImage(),

                      //SizedBox(height: 20.0,),
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _buildLoginBtn1(),
                  ]
                ),
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            _buildLoginBtn2(),
                          ]
                      ),
                  ]
              ),
                  ),
                ),
                  ]
              )
                )
              )
          );
  }
}

