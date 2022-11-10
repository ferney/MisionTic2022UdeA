otra forma

google_maps_flutter: ^2.2.1



######################
main.dart


import 'package:flutter/material.dart';
import 'package:flutter_googlemaps_test/flutter_map/simple_google_map/show_map.dart';

void main() {
  runApp(const MaterialApp(
    home: mapa())
  );
}


############################

mapa.dart

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class mapa extends StatefulWidget {
  const mapa({Key? key}) : super(key: key);

  @override
  State<mapa> createState() => _showMapState();
}

class _showMapState extends State<showMap> {
  late GoogleMapController mapController;
  static LatLng _center = const LatLng(23.816591317488747, 90.41560944927275);
  static LatLng _anotherLocation = const LatLng(23.7088442434317, 90.40608696755409);

  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("xxxxxxxxxxxxxxxxxxxx"),
      ),
      body: GoogleMap(
        markers: {x,y},
        mapType: MapType.terrain,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center,zoom: 14.0),),
        floatingActionButton: FloatingActionButton.extended(onPressed: _goToDU, label: Text("xxxxxxxxxxxxxxxxxxxxx"),
          icon: Icon(Icons.place)),
    );
  }
  static final CameraPosition duPosition = CameraPosition(target: LatLng(23.7341698,90.3905615),
      zoom: 14.0,
  bearing: 150.0,
  tilt: 35.0);
  
   Future<void>_goToDU()async{
    GoogleMapController controller = await mapController;
    controller.animateCamera(CameraUpdate.newCameraPosition(duPosition));
   }

  Marker x = Marker(markerId: MarkerId("xxxxxxxxxxxxxxxxxx"),
    position: _center,
    infoWindow: InfoWindow(title: "xxxxxxxxxxxxxx",snippet: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  );
  Marker y = Marker(markerId: MarkerId("xxxxxxxxxxxxxxxxx"),
    position: _anotherLocation,
    infoWindow: InfoWindow(title: "xxxxxxxxxxxxxxxxxx",snippet: "xxxxxxxxxxxxxxxxxxxxxxxxxxx"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  );
}
