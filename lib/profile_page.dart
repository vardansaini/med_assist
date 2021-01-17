import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lucifer/data.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                    })),
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
                        await showInformationDialog(context, userId, "blood_group");
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
              Card(
                elevation: 4.0,
                margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 1.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text("Critical Medical Conditions"),
                    ),
                    Text(" Your medical conditions here"),
                    ListTile(
                      title: Text("Emergency Contact"),
                    ),
                    ListTile(
                      title: Text("Alberta Health Card"),
                    )
                  ],
                ),
              )
            ])),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              onTap: (value) {
                // Respond to item press.
                setState(() => _currentIndex = value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: new Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.person),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile')
              ],
            ),
          );
        });
  }
}
