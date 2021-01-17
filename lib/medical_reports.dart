import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MedicalReportsPage extends StatefulWidget {
  @override
  _MedicalReportsPageState createState() => _MedicalReportsPageState();
}

class _MedicalReportsPageState extends State<MedicalReportsPage> {

  Widget _buildLoginBtn1() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: 330.0,
      height: 80.0,
      child: RaisedButton(
        onPressed: () {
          //Navigator.of(context).pop();
          //Navigator.of(context).pushNamed('/profileSetUp');

        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.tealAccent[700],
        child: Text(
          'Upload',
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.tealAccent[700],
          title: Text("Medical Reports"),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushNamed('/home_page');
              })),
      body: Container(padding: EdgeInsets.symmetric(
        horizontal: 40.0,
        vertical: 60.0,
      ),child: Column( mainAxisAlignment: MainAxisAlignment.center,children: [
        _buildLoginBtn1(),
      ],crossAxisAlignment: CrossAxisAlignment.center,),
      ),
    );
  }
}


