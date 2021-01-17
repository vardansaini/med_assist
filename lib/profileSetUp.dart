import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lucifer/data.dart';

class ProfilePageSetup extends StatefulWidget {
  @override
  _ProfilePageSetupState createState() => _ProfilePageSetupState();
}

class _ProfilePageSetupState extends State<ProfilePageSetup> {
  int _currentIndex = 1;
  String _name = "";
  TextEditingController _nameCont;
  @override
  void initState() {
    super.initState();
    _nameCont = TextEditingController();
  }

  @override
  void dispose() {
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

  Widget _buildLoginBtn1() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: 330.0,
      height: 80.0,
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed('/home_page');

        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.indigo[900],
        child: Text(
          'Done',
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
                backgroundColor: Colors.indigo[900],
                title: Text("Profile Page"),
                centerTitle: true,
                ),
            body: SingleChildScrollView(
                child: Column(children: <Widget>[
                  Card(
                      elevation: 4.0,
                      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 1.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(children: <Widget>[
                        ListTile(
                            title: Text("Name"),
                            subtitle: Text(userInfo["name"] ?? ""),
                            trailing: Icon(Icons.edit),
                            onTap: () async {
                              await showInformationDialog(context, userId, "name");
                            }),
                        ListTile(
                          title: Text("Age"),
                          subtitle: Text(userInfo["age"].toString() ?? ""),
                          trailing: Icon(Icons.edit),
                          onTap: () async {
                            await showInformationDialog(context, userId, "age");
                          },
                        ),
                        ListTile(
                          title: Text("Gender"),
                          subtitle: Text(userInfo["gender"] ?? ""),
                          trailing: Icon(Icons.edit),
                          onTap: () async {
                            await showInformationDialog(context, userId, "gender");
                          },
                        ),
                        ListTile(
                          title: Text("Blood Group"),
                          subtitle: Text(userInfo["blood_group"] ?? ""),
                          trailing: Icon(Icons.edit),
                          onTap: () async {
                            await showInformationDialog(
                                context, userId, "blood_group");
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
                        ListTile(
                          title: Text("Contact"),
                          subtitle: Text(userInfo["contact"] ?? ""),
                          trailing: Icon(Icons.edit),
                          onTap: () async {
                            await showInformationDialog(context, userId, "contact");
                          },
                        ),
                      ])),

                _buildLoginBtn1(),
                ]
                )
            ),

          );
        });
  }
}
