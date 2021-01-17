import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lucifer/data.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 1;
  String _name = '';
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

          //Navigator.of(context).pushNamed('/home_page');

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
    var userId = 'test';
    var users = FirebaseFirestore.instance.collection('users');
    return StreamBuilder<DocumentSnapshot>(
        stream: users.doc(userId).snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading');
          }

          var userInfo = snapshot.data.data();

          return Scaffold(
            appBar: AppBar(
<<<<<<< HEAD
                backgroundColor: Colors.tealAccent[700],
                title: Text("Profile Page", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
=======
                backgroundColor: Colors.redAccent,
                title: Text('Profile Page'),
>>>>>>> f7a89a475f4830986adde91a154727a1ca1cb219
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
<<<<<<< HEAD
                        title: Text("Name", style: TextStyle(fontSize: 18)),
                        subtitle: Text(userInfo["name"] ?? "", style: TextStyle(fontSize: 16),),
=======
                        title: Text('Name'),
                        subtitle: Text(userInfo['name'] ?? ''),
>>>>>>> f7a89a475f4830986adde91a154727a1ca1cb219
                        trailing: Icon(Icons.edit),
                        onTap: () async {
                          await showInformationDialog(context, userId, 'name');
                        }),
                    ListTile(
<<<<<<< HEAD
                      title: Text("Age", style: TextStyle(fontSize: 18)),
                      subtitle: Text(userInfo["age"].toString() ?? "", style: TextStyle(fontSize: 16),),
=======
                      title: Text('Age'),
                      subtitle: Text(userInfo['age'].toString() ?? ''),
>>>>>>> f7a89a475f4830986adde91a154727a1ca1cb219
                      trailing: Icon(Icons.edit),
                      onTap: () async {
                        await showInformationDialog(context, userId, 'age');
                      },
                    ),
                    ListTile(
<<<<<<< HEAD
                      title: Text("Gender", style: TextStyle(fontSize: 18)),
                      subtitle: Text(userInfo["gender"] ?? "", style: TextStyle(fontSize: 16),),
=======
                      title: Text('Gender'),
                      subtitle: Text(userInfo['gender'] ?? ''),
>>>>>>> f7a89a475f4830986adde91a154727a1ca1cb219
                      trailing: Icon(Icons.edit),
                      onTap: () async {
                        await showInformationDialog(context, userId, 'gender');
                      },
                    ),
                    ListTile(
<<<<<<< HEAD
                      title: Text("Blood Group", style: TextStyle(fontSize: 18)),
                      subtitle: Text(userInfo["blood_group"] ?? "", style: TextStyle(fontSize: 16),),
=======
                      title: Text('Blood Group'),
                      subtitle: Text(userInfo['blood_group'] ?? ''),
>>>>>>> f7a89a475f4830986adde91a154727a1ca1cb219
                      trailing: Icon(Icons.edit),
                      onTap: () async {
                        await showInformationDialog(
                            context, userId, 'blood_group');
                      },
                    ),
                    ListTile(
<<<<<<< HEAD
                      title: Text("Address", style: TextStyle(fontSize: 18)),
                      subtitle: Text(userInfo["address"] ?? "", style: TextStyle(fontSize: 16),),
=======
                      title: Text('Address'),
                      subtitle: Text(userInfo['address'] ?? ''),
>>>>>>> f7a89a475f4830986adde91a154727a1ca1cb219
                      trailing: Icon(Icons.edit),
                      onTap: () async {
                        await showInformationDialog(context, userId, 'address');
                      },
                    ),
                    ListTile(
<<<<<<< HEAD
                      title: Text("Contact", style: TextStyle(fontSize: 18)),
                      subtitle: Text(userInfo["contact"] ?? "", style: TextStyle(fontSize: 16),),
=======
                      title: Text('Contact'),
                      subtitle: Text(userInfo['contact'] ?? ''),
>>>>>>> f7a89a475f4830986adde91a154727a1ca1cb219
                      trailing: Icon(Icons.edit),
                      onTap: () async {
                        await showInformationDialog(context, userId, 'contact');
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
                      title: Text('Critical Medical Conditions'),
                    ),
                    Text('Your medical conditions here'),
                    ListTile(
                      title: Text('Emergency Contact'),
                    ),
                    ListTile(
                      title: Text('Alberta Health Card'),
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
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
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
