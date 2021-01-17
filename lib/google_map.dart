import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'src/locations.dart' as locations;

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  bool mapToggle = false;
  var currentLocation;

  void initState(){
    super.initState();
    Geolocator.getCurrentPosition().then((currloc){
      currentLocation = currloc;
      mapToggle = true;
    });
  }

  final Map<String, Marker> _markers = {};
  GoogleMapController mapController;
  Future<void> _onMapCreated(mapController) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  /*_addMarker(){
    var marker = MarkerOptions(position: controlle
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Office Locations'),
        backgroundColor: Colors.green[700],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
          height: MediaQuery.of(context).size.height - 80.0,
                width: double.infinity,
                child: mapToggle ?
      GoogleMap(onMapCreated: _onMapCreated, initialCameraPosition: CameraPosition(
        target: LatLng(currentLocation.latitude, currentLocation.longitude),zoom: 10.0
      ),):
      Center(child: Text('Loading.. PLease wait..'),),
                /*GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: const LatLng(0, 0),
                    zoom: 2,
                  ),
                  myLocationEnabled: true,
                  markers: _markers.values.toSet(),
                  compassEnabled: true,
                ),
              ),
              Positioned(
                bottom: 50,
                right: 10,
                child: FlatButton(
                  child: Icon(
                    Icons.pin_drop,
                    color: Colors.blue,
                  ),
                  color: Colors.white,
                  //onPressed: _addMarker,*/
                ),

            ],
          ),
        ],
      ),
    );
  }
}
