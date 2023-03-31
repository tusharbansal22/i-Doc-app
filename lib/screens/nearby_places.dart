import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:i_doc_app/model/nearby_response.dart';
import 'package:http/http.dart' as http;

class NearbyPlaces extends StatefulWidget {

  NearbyPlaces({Key? key}) : super(key: key);

  @override
  State<NearbyPlaces> createState() => _NearbyPlacesState();
}
class _NearbyPlacesState extends State<NearbyPlaces> {

  late Map position = {};

  NearbyPlacesResponse nearbyPlacesResponse = NearbyPlacesResponse();


  @override
  Widget build(BuildContext context) {

    position = ModalRoute.of(context)!.settings.arguments as Map;

    String lati = position.toString().substring(21,31);
    String longi = position.toString().substring(44,54);

    return Scaffold(
      appBar: AppBar(
        title:Text("Nearby Places"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            ElevatedButton(
                onPressed: (){
                  // print("-------------------------------------------------------------"+position.toString());
                  // print(">>>>>>>>"+lati);
                  // print(">>>>>>>>"+longi);
                  getNearbyPlaces(lati,longi);
                },
                child: Text('Get Nearby Places')),
            if(nearbyPlacesResponse.results != null)
              for(int i = 0; i < nearbyPlacesResponse.results!.length; i++)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: nearbyPlacesWidget(nearbyPlacesResponse.results![i]),
                )
          ],
        ),
      ),
    );
  }

  void getNearbyPlaces(String lati, String longi) async{

    var url = Uri.parse("https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=eye hospital&location="+lati+","+longi+"&radius=7000&key=AIzaSyCfji-2Vks33aYwu-KJ-66YIcJ5dmdyD4I");

    var response = await http.post(url);

    //print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+url.toString());

    nearbyPlacesResponse = NearbyPlacesResponse.fromJson(jsonDecode(response.body));

    setState(() {});

  }

  Widget nearbyPlacesWidget(Results result) {
    return OutlinedButton(
      onPressed: () {

        // print("-----------------------------------------");
        // print(result.geometry!.location!.lat!.toStringAsFixed(7));
        // print(result.geometry!.location!.lng!.toStringAsFixed(7));
        Navigator.pushReplacementNamed(context, '/polyline', arguments: {

          'initialPoint_lat' : position.toString().substring(21,31),
          'initialPoint_lng' : position.toString().substring(44,54),

          'finalPoint_lat' : result.geometry!.location!.lat!.toStringAsFixed(7),
          'finalPoint_lng' : result.geometry!.location!.lng!.toStringAsFixed(7),

        });
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
        ),
      ),
      child: Column(
        children: [
          Text("Name: "+ result.name!),
          Text("Ratings: "+ result.rating!.toString()),
          Container(
              child:
              result.openingHours != null ?
              Text("Open", style: TextStyle(color: Colors.green))  :
              Text("Closed", style: TextStyle(color: Colors.red))
          ),
        ],
      ),
    );
  }
}