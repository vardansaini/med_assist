import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends State<HomePage>{
  int _button1Pressed = 0;
  @override
  void initState(){
    super.initState();
    _button1Pressed = 0;
  }
  Widget _smallButton(String labelTextBut) {
    return Container(
      decoration: BoxDecoration(
        color: ( _button1Pressed == 1) ? Colors.blue : Colors.black,
        shape: BoxShape.circle
      ),
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 100,
      height: 100,
      child: MaterialButton(
        color: ( _button1Pressed == 1) ? Colors.blue : Colors.black,
        padding: EdgeInsets.all(16.0),
        shape: CircleBorder(),
        onPressed: () {
          setState(() {
            _button1Pressed = 1;
          });
        },
        // color: Colors.white,
        child: Icon(Icons.people, size: 40,),
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
