import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MedicalReportsPage extends StatefulWidget {
  @override
  _MedicalReportsPageState createState() => _MedicalReportsPageState();
}

class _MedicalReportsPageState extends State<MedicalReportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("Medical Reports"),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushNamed('/home_page');
              })),
    );
  }
}


