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
  void _buttonPressed(int iconSel){
    switch (iconSel){
      case 1: {
        Navigator.of(context).pushNamed('/profile_page');
      }break;
      case 2: {

      }break;
      case 3: {

      }break;
      case 4: {
        Navigator.of(context).pushNamed('/medicines');
      }break;
      case 5: {
        //Navigator.of(context).pushNamed('');
      }break;

    }

  }
  Widget _buildButton(int iconSel, int butSize) {
    return MaterialButton(
      color: (true) ? Colors.blue : Colors.black,
      padding: EdgeInsets.all(16.0),
      shape: CircleBorder(),
      onPressed: () {
        setState(() {
          _button1Pressed = 1;
          _buttonPressed(iconSel);
        });
      },
      // color: Colors.white,
      child: iconSel == 3 ? Text("Help") :
      Icon((iconSel==1 ? Icons.person :
      (iconSel == 2 ? Icons.house_outlined:
      ( iconSel == 4 ? Icons.assignment : Icons.backpack))), size: (butSize == 1 ? 70 : 150)),
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              _buildButton(1, 1),
                              _buildButton(2, 1),
                            ],
                          ),
                          _buildButton(3,2),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              _buildButton(4, 1),
                              _buildButton(5, 1),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
