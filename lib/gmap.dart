import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMap extends StatefulWidget{
  GMap({Key? key}) : super(key: key);

  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Duraklar'),
        ),
        body: GoogleMap(initialCameraPosition: CameraPosition(
          target: LatLng(37.77483, -122.41942),
          zoom: 12,
        ),

        )
    );
  }
}