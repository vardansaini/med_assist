import 'package:flutter/material.dart';
import 'package:lucifer/login_page.dart';
import 'package:lucifer/medicines.dart';
import 'package:lucifer/profile_page.dart';

import 'home_page.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Med Assist',
      routes: <String, WidgetBuilder> {
        '/profile_page': (BuildContext context) => ProfilePage(),
        '/home_page' : (BuildContext context) => HomePage(),
        '/medicines' : (BuildContext context) => MedicinesPage(),
        '/login_page' : (BuildContext context) => LoginPage(),
      },
      home: HomePage(),
    );
  }
}


