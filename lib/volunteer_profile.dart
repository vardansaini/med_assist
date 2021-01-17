import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lucifer/data.dart';

class VolunteerPage extends StatefulWidget {
  @override
  VolunteerPageState createState() => VolunteerPageState();
}

class VolunteerPageState extends State<VolunteerPage> {
  int _currentIndex = 1;
  String _name = "";
  TextEditingController _nameCont;
  @override
  void initState(){
    super.initState();
    _nameCont = TextEditingController();
  }
  @override
  void dispose(){
    super.dispose();
    _nameCont.dispose();
  }
  Future<void> showInformationDialog(
      BuildContext context, String userId, String key) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: TextFormField(
                controller: _nameCont,
              ),
              actions: <Widget>[
                TextButton(
                    child: Text('Done'),
                    onPressed: () {
                      _name = _nameCont.text;
                      updateUser(userId, key, _name);
                      print(_name);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    String userId = "test";
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return StreamBuilder<DocumentSnapshot>(
        stream: users.doc(userId).snapshots(),
        builder:
        (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
           return Text("Loading");
        }

        Map<String, dynamic> userInfo = snapshot.data.data();
        return Scaffold(
         appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("Profile Page"),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }
          )
      ),
          body: SingleChildScrollView(
             child: Column(
              children: <Widget>[
                Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 1.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                        children: <Widget>[
                          ListTile(
                              title: Text("Name"),
                              subtitle: Text(userInfo["name"] ?? ""),
                              trailing: Icon(Icons.edit),
                              onTap: () async {
                              await showInformationDialog(context, userId, "name");
                          },),
                          ListTile(
                              title: Text("Contact number"),
                              subtitle: Text(userInfo["contact number"].toString() ?? ""),
                              trailing: Icon(Icons.edit),
                              onTap: () async {
                              await showInformationDialog(context, userId, "contact number");
                            },
                          ),
                          ListTile(
                              title: Text("Alternate contact number"),
                              subtitle: Text(userInfo["Alternate contact number"] ?? ""),
                              trailing: Icon(Icons.edit),
                              onTap: () async {
                              await showInformationDialog(context, userId, "Alternate contact number");
                          },
                          ),
                          ListTile(
                              title: Text("E-mail"),
                              subtitle: Text(userInfo["E-mail"] ?? ""),
                              trailing: Icon(Icons.edit),
                              onTap: () async {
                              await showInformationDialog(context, userId, "E-mail");
                              },
                          ),
                          ListTile(
                              title: Text("Address"),
                              subtitle: Text(userInfo["address"] ?? ""),
                              trailing: Icon(Icons.edit),
                              onTap: () async {
                              await showInformationDialog(context, userId, "address");
                          },
                          ),


                        ]
                    )

                ))],
                Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 1.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.redAccent,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text("Thank you for being a With you volunteer. Your help is appreciated.",
                            style: TextStyle(color: Colors.white,
                              fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            ),
                        ),


                      ),
                    ],
                  ),
                )
              ]
          )
      ),
    );
        };);
}}