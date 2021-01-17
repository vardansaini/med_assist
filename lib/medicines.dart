import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MedicinesPage extends StatefulWidget {
  @override
  _MedicinesPageState createState() => _MedicinesPageState();
}

class _MedicinesPageState extends State<MedicinesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
          backgroundColor: Colors.tealAccent[700],
          title: Text("Medicines"),
=======
          backgroundColor: Colors.redAccent,
          title: Text('Medicines'),
>>>>>>> f7a89a475f4830986adde91a154727a1ca1cb219
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushNamed('/home_page');
              })),
      body: MedicinesList('test'),
    );
  }
}

class MedicinesList extends StatelessWidget {
  final String documentId;

  MedicinesList(this.documentId);

  @override
  Widget build(BuildContext context) {
    var users = FirebaseFirestore.instance.collection('users');
    return StreamBuilder<DocumentSnapshot>(
      stream: users.doc(documentId).snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading');
        }

        return ListView(
          children: snapshot.data
              .data()['medicines']
              .entries
              .map<ListTile>((MapEntry<String, dynamic> entry) => ListTile(
                  title: Text(entry.key), subtitle: Text(entry.value)))
              .toList(),
        );
      },
    );
  }
}
