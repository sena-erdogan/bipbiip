import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bipbiip/gmap.dart';
import 'package:flutter/material.dart';
import 'package:bipbiip/Mapscreen.dart';
import 'WaitingButton.dart';

import 'main.dart';


class OtherSide extends StatefulWidget {
  @override
  _OtherSideState createState() => _OtherSideState();
}

class _OtherSideState extends State<OtherSide> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> markers = [];

  @override
  void initState(){
    intilize();
    super.initState();
  }

  intilize(){
    Marker firstMarker = Marker(
      markerId: MarkerId('first'),
      position: LatLng(40.80897, 29.36478),
      infoWindow: InfoWindow(
          title: "Gebze Teknik Üniversitesi",
          snippet: "ilk durak"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    Marker secondMarker = Marker(
      markerId: MarkerId('second'),
      position: LatLng(40.80685, 29.35952),
      infoWindow: InfoWindow(
          title: "GTÜ Kütüphanesi",
          snippet: "ikinci durak"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    Marker thirdMarker = Marker(
      markerId: MarkerId('third'),
      position: LatLng(40.81057, 29.36895),
      infoWindow: InfoWindow(
          title: "McDonald's",
          snippet: "üçüncü durak"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    Marker fourthMarker = Marker(
      markerId: MarkerId('fourth'),
      position: LatLng(40.79619, 29.44233),
      infoWindow: InfoWindow(
          title: "Gebze Center AVM",
          snippet: "dördüncü durak"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    Marker fifthMarker = Marker(
      markerId: MarkerId('fifth'),
      position: LatLng(40.79549, 29.45948),
      infoWindow: InfoWindow(
          title: "Gebze Otogar",
          snippet: "beşinci durak"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    Marker sixthMarker = Marker(
      markerId: MarkerId('sixth'),
      position: LatLng(40.79047, 29.49406),
      infoWindow: InfoWindow(
          title: "Gebze KYK Yurdu",
          snippet: "altıncı durak"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    markers.add(firstMarker);
    markers.add(secondMarker);
    markers.add(thirdMarker);
    markers.add(fourthMarker);
    markers.add(fifthMarker);
    markers.add(sixthMarker);
    setState(() {
    });
  }
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(40.79047, 29.49406),
    zoom: 9,
  );
  late GoogleMapController _googleMapController;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation:0.5,
        backgroundColor: Colors.transparent,
        title: Text('Duraklar'),
        centerTitle: true,
      ),
      body: Container(

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              //Color.fromRGBO(245, 101, 3, 1),
              Color.fromRGBO(211, 87, 3, 1),
              Color.fromRGBO(24, 28, 79, 1),
              Color.fromRGBO(14, 17,53, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        // margin: EdgeInsets.only(bottom: 350),
        padding: EdgeInsets.only(top: 80),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              Container(

                width: MediaQuery.of(context).size.width,
                height: 220,

                child:GoogleMap(
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: false,
                  initialCameraPosition: _initialCameraPosition,
                  onMapCreated: (GoogleMapController controller){
                    _controller.complete(controller);
                    _googleMapController = controller;
                  },
                  markers: markers.map((e) => e).toSet(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:25),

                child:Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MapScreen()));
                        },
                        style: OutlinedButton.styleFrom(
                          fixedSize: Size(150, 50),
                          backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20)),
                              side: BorderSide(
                                  color:  Color.fromRGBO(31, 36, 91, 1), width: 1)
                          ),
                        ),

                        child: Text('KYK',
                          style: TextStyle(height: 2, fontSize: 18),
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>OtherSide()));
                        },
                        style: OutlinedButton.styleFrom(
                          primary: Color.fromRGBO(237, 98,2, 1),
                          fixedSize: Size(150, 50),
                          backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20)),
                              side: BorderSide(
                                  color:  Color.fromRGBO(31, 36, 91, 1), width: 1)
                          ),
                        ),
                        child: Text('Üniversite',
                          style: TextStyle(height: 2, fontSize: 18),
                        ),
                      ),
                    ]
                ),
              ),

              SingleChildScrollView(
                child:Flexible(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 50.0,left:13,right:13,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.3),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                          top: 10.0,
                          bottom:250.0
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30.0,left:20,right:20,
                            ),
                            child: Column(

                              children: <Widget>[
                                //greeting text
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: <Widget>[
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>WaitingButton()));
                                              },
                                              style: OutlinedButton.styleFrom(
                                                primary: Color.fromRGBO(195, 195,195, 1),
                                                fixedSize: Size(325, 50),
                                                side: BorderSide(color:Color.fromRGBO(46,72,128, 1), width:2),
                                                backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),

                                              ),
                                              child: Text('Gebze Teknik Üniversitesi',
                                                style: TextStyle(height: 2, fontSize: 18),
                                              ),
                                            ),
                                          ]
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                //app work
                                Column(
                                    children: <Widget>[
                                      Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>WaitingButton()));
                                              },
                                              style: OutlinedButton.styleFrom(
                                                primary: Color.fromRGBO(195, 195,195, 1),
                                                fixedSize: Size(325, 50),
                                                side: BorderSide(color:Color.fromRGBO(46,72,128, 2), width:2),
                                                backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),

                                              ),
                                              child: Text('GTÜ Kütüphanesi',
                                                style: TextStyle(height: 2, fontSize: 18),
                                              ),
                                            ),
                                          ]
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>WaitingButton()));
                                              },
                                              style: OutlinedButton.styleFrom(
                                                primary: Color.fromRGBO(195, 195,195, 1),
                                                fixedSize: Size(325, 50),
                                                side: BorderSide(color:Color.fromRGBO(46,72,128, 2), width:2),
                                                backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),

                                              ),
                                              child: Text("Çayırova Köprüsü(McDonald's)",
                                                style: TextStyle(height: 2, fontSize: 18),
                                              ),
                                            ),
                                          ]
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>WaitingButton()));
                                              },
                                              style: OutlinedButton.styleFrom(
                                                primary: Color.fromRGBO(195, 195,195, 1),
                                                fixedSize: Size(325, 50),
                                                side: BorderSide(color:Color.fromRGBO(46,72,128, 2), width:2),
                                                backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),

                                              ),
                                              child: Text("Gebze Center AVM",
                                                style: TextStyle(height: 2, fontSize: 18),
                                              ),
                                            ),
                                          ]
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>WaitingButton()));
                                              },
                                              style: OutlinedButton.styleFrom(
                                                primary: Color.fromRGBO(195, 195,195, 1),
                                                fixedSize: Size(325, 50),
                                                side: BorderSide(color:Color.fromRGBO(46,72,128, 2), width:2),
                                                backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),

                                              ),
                                              child: Text("Gebze Otogar",
                                                style: TextStyle(height: 2, fontSize: 18),
                                              ),
                                            ),
                                          ]
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>WaitingButton()));
                                              },
                                              style: OutlinedButton.styleFrom(
                                                primary: Color.fromRGBO(195, 195,195, 1),
                                                fixedSize: Size(325, 50),
                                                side: BorderSide(color:Color.fromRGBO(46,72,128, 2), width:2),
                                                backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),

                                              ),
                                              child: Text("KYK",
                                                style: TextStyle(height: 2, fontSize: 18),
                                              ),
                                            ),
                                          ]
                                      ),
                                    ]
                                ),
                                //add button
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),

      ),
    );
  }
}