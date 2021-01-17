import 'package:flutter/material.dart';
import 'package:lucifer/medicines.dart';
import 'package:lucifer/profile_page.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Med Assist',
      routes: <String, WidgetBuilder> {
        '/profile_page': (BuildContext context) => ProfilePage(),
        '/home_page' : (BuildContext context) => HomePage(),
        '/medicines' : (BuildContext context) => MedicinesPage(),
      },
      home: ProfilePage(),
    );
  }
}


