import 'package:flutter/material.dart';

class NeedVolunteer extends StatefulWidget {
  @override
  NeedVolunteerState createState() => NeedVolunteerState();
}

class NeedVolunteerState extends State<NeedVolunteer> {
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
  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context){
          return AlertDialog(
              content: TextFormField(
                controller: _nameCont,
              ),
              actions: <Widget> [
                TextButton(
                    child: Text('SEND',
                      style: TextStyle(color: Colors.blueAccent,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                       ),
                    ),
                    onPressed: () {
                      //SEND THE MESSAGE THE USER TYPES WITH THE ALERT TO THE VOLUNTEERS
                      _name = _nameCont.text;
                      print(_name);
                      Navigator.of(context).pop();
                    }
                )
              ]
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("With you",
            style: TextStyle(color: white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            ),
          ),
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
                    color: Colors.blueAccent
                    child: Column(
                        children: <Widget>[
                          ListTile(
                              title: Text("Hey there! What help do you need?",
                                style: TextStyle(color: white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                               ),
                              ),
                              trailing: Icon(Icons.edit),
                              onTap: () async {
                                await showInformationDialog(context);
                              }
                          ),
                          Text("$_name")

                        ]
                    )

                ),
              ],
          ),
      )
    );
  }
}