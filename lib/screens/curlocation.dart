import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({Key? key}) : super(key: key);

  @override
  State<CurrentLocationScreen> createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {

  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition =
  CameraPosition(target: LatLng(37.42796133580664, -122.085749655962),zoom: 14);

  Set<Marker> markers = {};


  Future<Position> determinePosition() async{

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if(!serviceEnabled){
      //return Future.error('Location services are disabled');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
    }

    permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        //return Future.error('Location services are disabled');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Location services are disabled')));
      }
    }
    if(permission == LocationPermission.deniedForever){
      //return Future.error('Location permissions are permanently denied');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are permanently disabled')));
    }

    Position position = await Geolocator.getCurrentPosition();

    print(position);

    return position;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current location'),
        centerTitle: true,
      ),
      body:   GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller){
          googleMapController = controller;
        },
      ),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () async{
            Position position = await determinePosition();

            googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                    CameraPosition(target: LatLng(position.latitude, position.longitude),zoom: 14)));

            markers.clear();

            markers.add(Marker(markerId: MarkerId('currentLocation'),
                position:LatLng(position.latitude, position.longitude)));

            setState(() {});
          },
          child: Text('Current Location'),
        ),
        ElevatedButton(
          onPressed: () async{
            Position position = await determinePosition();
            // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            //   return NearbyPlaces(position: position);
            // }));
            Navigator.pushReplacementNamed(context, '/nearbyplaces', arguments: {
              'position' : position,
            });
          },
          child: Text('Nearby Places'),
        ),
      ],
    );
  }
}