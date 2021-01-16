import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends State<HomePage>{
  bool _button1Pressed;
  @override
  void initState(){
    super.initState();
    _button1Pressed = false;
  }
  Widget _smallButton(String labelTextBut) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 160.0,
      height: 180.0,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          setState(() {
            _button1Pressed = true;
          });
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        // color: Colors.white,
        child: Text(
          '$labelTextBut',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
          textAlign: TextAlign.center,
        ),
        color:  true ? Colors.blue : Colors.black,
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
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF73AEF5),
                          Color(0xFF61A4F1),
                          Color(0xFF478DE0),
                          Color(0xFF398AE5),
                        ],
                        stops: [0.1, 0.4, 0.7, 0.9],
                      ),
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 80.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _smallButton("profile"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
