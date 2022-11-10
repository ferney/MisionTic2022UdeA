google_maps_flutter: ^2.2.0

  
  <meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="aqui su API KEY  " />
  ###########################

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const myApp());

/*void main() {
  runApp(const MaterialApp(home: Maps(),));
}*/

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'mapas flutter xyz',
      home: Maps(),
    );
  }
}

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);
  @override
  State<Maps> createState() => MapsState();
}

class MapsState extends State<Maps> {
  ///generar un controlafdor par ale mapa
  final mapController = Completer<GoogleMapController>();
  //poner un inicio del mapa
  final inicialPosition = const CameraPosition(
    target: LatLng(-23.680456, -50.872345),
    zoom: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mapas flutter'),
      ),
      body: GoogleMap(
        //pocison inical
        initialCameraPosition: inicialPosition,

        ///controlador del  mapa
        onMapCreated: (controller) {
          mapController.complete(controller);
        },
        //tipo de mapa
        mapType: MapType.normal,

        //si doy clic en el mapa, tome las coordenadas del touch y muevase alla
        onTap: (coordenadas) async {
          //solo mueva la camara basado en el touch
          (await mapController.future).animateCamera(
            CameraUpdate.newLatLng(coordenadas),
          );
        },
        
        /*mover la camara y cambiar el zoom
         onTap: (coordenadas) async {
         (await mapController.future).animateCamera(
            CameraUpdate.newLatLngZoom(coordenadas,13),
          );
        },
         
         
        */  
        

        markers: {
          const Marker(
              //marcador unico # unico para cada marcador
              markerId: MarkerId('marca_id'),
              position: LatLng(-23.680456, -50.872345),
              infoWindow: InfoWindow(
                title: 'marcador 1',
                snippet: 'de click y miramos a ver que hace',
              ))
        },
      ),
    );
  }
}
