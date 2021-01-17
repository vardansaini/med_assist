import 'package:flutter/material.dart';

class Alerts extends StatefulWidget {
  @override
  AlertsState createState() => AlertsState();
}

class AlertsState extends State<Alerts> {
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
                    child: Text('Done'),
                    onPressed: () {
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
          title: Text("ALERTS"),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.warning_amber_rounded),
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
                              trailing: Icon(Icons.edit),
                              onTap: () async {
                                await showInformationDialog(context);
                              }
                          ),
                          Text("$_name"),


                        ]
                    )

                ),
                Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 1.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.redAccent,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text("Thank you for being a With you volunteer. Your help is appreciated."),
                      ),
                    ],
                  ),
                )
              ]
          )
      ),
    );
  }
}