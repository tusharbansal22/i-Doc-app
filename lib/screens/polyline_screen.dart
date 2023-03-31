import 'dart:convert';
import 'package:i_doc_app/model/polyline_response.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolyLineScreen extends StatefulWidget {
  const PolyLineScreen({Key? key}) : super(key: key);

  @override
  State<PolyLineScreen> createState() => _PolyLineScreenState();
}

class _PolyLineScreenState extends State<PolyLineScreen> {

  late GoogleMapController _controller;
  String totalTime = '';
  String totalDistance = '';
  String apiKey = 'AIzaSyCfji-2Vks33aYwu-KJ-66YIcJ5dmdyD4I';
  late String finalPoint;
  late String initialPoint;
  late Map<dynamic, dynamic> points = {};
  late String origin_lat;
  late String origin_lng;
  late String destination_lat;
  late String destination_lng;

  // LatLng origin = LatLng(21.163742, 81.660690);
  // LatLng destination = LatLng(21.176208, 81.688315);

  CameraPosition initialPosition =
  CameraPosition(target: LatLng(21.16254343628297, 81.6595860603585), zoom: 14);



  PolyLineResponse polyLineResponse = PolyLineResponse();

  Set<Polyline> polyLinePoints = {};

  Set<Marker> markers = {};



  void drawPolyLine(String origin_lat, String origin_lng, String destination_lat, String destination_lng) async {
    var url = Uri.parse(
        "https://maps.googleapis.com/maps/api/directions/json?key=" + apiKey +
            "&units=metric&origin=" +
            origin_lat + "," + origin_lng +
            "&destination=" + destination_lat + "," +
            destination_lng + "&mode=driving");

    print(url);
    var response = await http.post(url);

    polyLineResponse = PolyLineResponse.fromJson(jsonDecode(response.body));

    totalDistance = polyLineResponse.routes![0].legs![0].distance!.text!;
    totalTime = polyLineResponse.routes![0].legs![0].duration!.text!;

    for (int i = 0; i <
        polyLineResponse.routes![0].legs![0].steps!.length; i++) {
      polyLinePoints.add(Polyline(polylineId: PolylineId(
          polyLineResponse.routes![0].legs![0].steps![i].polyline!.points!),
          points: [
            LatLng(
                polyLineResponse.routes![0].legs![0].steps![i].startLocation!.lat!,
                polyLineResponse.routes![0].legs![0].steps![i].startLocation!
                    .lng!),
            LatLng(
                polyLineResponse.routes![0].legs![0].steps![i].endLocation!.lat!,
                polyLineResponse.routes![0].legs![0].steps![i].endLocation!.lng!),
          ],
          width: 5, color: Colors.deepOrange
      ));

    }

    markers.clear();

    markers.add(Marker(markerId: MarkerId('1'),
        position:LatLng(double.parse(origin_lat),double.parse(origin_lng))));

    markers.add(Marker(markerId: MarkerId('2'),
        position:LatLng(double.parse(destination_lat),double.parse(destination_lng))));

    _controller.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(double.parse(origin_lat),double.parse(origin_lng)),zoom: 12)));

    setState(() {});

  }


  @override
  Widget build(BuildContext context) {

    points = ModalRoute.of(context)!.settings.arguments as Map<dynamic,dynamic>;

    origin_lat = points['initialPoint_lat'];
    origin_lng = points['initialPoint_lng'];
    destination_lat = points['finalPoint_lat'];
    destination_lng = points['finalPoint_lng'];



    return Scaffold(
      appBar: AppBar(
        title: Text("PolyLine"),
      ),
      body: Stack(
        children: [
          GoogleMap(
            polylines: polyLinePoints ,
            markers: markers,
            zoomControlsEnabled: false,
            initialCameraPosition: initialPosition,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
            },
          ),

          Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Total Distance: ' + totalDistance),
                Text('Total Time: ' + totalTime),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          drawPolyLine(origin_lat,origin_lng,destination_lat,destination_lng);
        },
        child: Icon(Icons.directions),
      ),
    );
  }
}