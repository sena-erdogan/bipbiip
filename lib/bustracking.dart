import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:location/location.dart';


class bustracking extends StatefulWidget{
  bustracking({Key? key}) : super(key: key);

  @override
  _bustrackingState createState() => _bustrackingState();
}

class _bustrackingState extends State<bustracking> {

    StreamSubscription? _locationSubscription ;
    Location _locationTracker = Location();
    Marker marker = Marker(markerId: MarkerId('home'));
    Circle circle = Circle(circleId: CircleId('bus'));
    late GoogleMapController _controller;

    static final CameraPosition initialLocation = CameraPosition(
      target: LatLng(40.79069, 29.49221),
      zoom: 14.4746,
    );

    Future<Uint8List> getMarker() async {
      ByteData byteData = await DefaultAssetBundle.of(context).load("assets/bus.png");
      return byteData.buffer.asUint8List();
    }

    void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData){
      LatLng latlng = LatLng(newLocalData.latitude!, newLocalData.longitude!);
      this.setState((){
        marker = Marker(
        markerId: MarkerId("home"),
        position: latlng,
        rotation: newLocalData.heading!,
        draggable: false,
        zIndex: 2,
        flat: true,
        anchor: Offset(0.5, 0.5),
        icon: BitmapDescriptor.fromBytes(imageData));
        circle = Circle(
        circleId: CircleId("bus"),
        radius: newLocalData.accuracy!,
        zIndex:1,
        strokeColor: Colors.blue,
        center: latlng,
        fillColor:Colors.blue.withAlpha(70)
        );
      });
    }

    void getCurrentLocation() async{
      try{

        Uint8List imageData = await getMarker();
        var location = await _locationTracker.getLocation();

        updateMarkerAndCircle(location, imageData);

        if(_locationSubscription != null) {
          _locationSubscription!.cancel();
        }

        _locationSubscription = _locationTracker.onLocationChanged.listen((newLocalData){
            if(_controller != null){
              _controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
                bearing: 192.8334901395799,
                target: LatLng(newLocalData.latitude!, newLocalData.longitude!),
                tilt: 0,
                zoom: 18.00)));
            updateMarkerAndCircle(newLocalData, imageData);
            }
        });
      }  on PlatformException catch(e){
        if(e.code == 'PERMISSION_DENIED'){
          debugPrint("Permission Denied");
        }
      }
    }
    @override
    void dispose(){
      if(_locationSubscription != null){
        _locationSubscription!.cancel();
      }
      super.dispose();
    }

    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text( "Servis Takip"),
        ),
        body: GoogleMap(
          //mapType: MapType.hybrid,
          initialCameraPosition: initialLocation,
          markers: Set.of((marker!= null) ? [marker] : []),
          circles: Set.of((circle != null) ? [circle] : []),
          onMapCreated : (GoogleMapController controller) {
            _controller = controller;
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.location_searching),
          onPressed: () {
            getCurrentLocation();
          }),
      );
    }

}
