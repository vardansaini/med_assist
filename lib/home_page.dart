import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _button1Pressed = 0;
  @override
  void initState() {
    super.initState();
    _button1Pressed = 0;
  }

  void _buttonPressed(int iconSel) {
    switch (iconSel) {
      case 1:
        {
          Navigator.of(context).pushNamed('/profile_page');
        }
        break;
      case 2:
        {
          Navigator.of(context).pushNamed('/login_page');
        }
        break;
      case 3:
        {}
        break;
      case 4:
        {
          Navigator.of(context).pushNamed('/medicines');
        }
        break;
      case 5:
        {
          //Navigator.of(context).pushNamed('');
        }
        break;
    }
  }

  Widget _buildButton(int iconSel, int butSize) {
    return MaterialButton(
      elevation: 8.0,
      color: (iconSel==3) ? Colors.indigo[700] : Colors.redAccent,
      padding: EdgeInsets.all(16.0),
      shape: CircleBorder(),
      onPressed: () {
        setState(() {
          //_button1Pressed = 1;
          _buttonPressed(iconSel);
        });
      },
      // color: Colors.white,
      child: iconSel == 3
          ? Container(
              padding: EdgeInsets.all(35),
              child: Text(
                "Help",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ))
          : Icon(
              (iconSel == 1
                  ? Icons.person
                  : (iconSel == 2
                      ? Icons.house_outlined
                      : (iconSel == 4 ? Icons.assignment : Icons.backpack))),
              size: (butSize == 1
                  ? MediaQuery.of(context).size.height / 9
                  : MediaQuery.of(context).size.height / 4.5),
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
                        color: Colors.deepOrange[50],
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
                          Container(
                              height: MediaQuery.of(context).size.height / 5,
                              child: Align(
                                alignment: Alignment(0, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    _buildButton(1, 1),
                                    Spacer(),
                                    _buildButton(2, 1),
                                  ],
                                ),
                              )),
                          Container(
                              height:
                                  MediaQuery.of(context).size.height * 2 / 5,
                              child: Align(
                                alignment: Alignment(0, 0),
                                child: _buildButton(3, 2),
                              )),
                          Container(
                              height: MediaQuery.of(context).size.height / 5,
                              child: Align(
                                alignment: Alignment(0, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    _buildButton(4, 1),
                                    Spacer(),
                                    _buildButton(5, 1),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
