import 'dart:async';

import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  // GoogleMapController newGoogleMapController  ;
  final CameraPosition kSoftwareHouse = const CameraPosition(
    target: LatLng(33.575275, 71.457099),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MYDetailsappbar(
          text: 'Map',
          onpressed: () => Navigator.pop(context),
        ),
        body: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: kSoftwareHouse,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            // _controller=controller as Completer<GoogleMapController>;
          },
        ),
      ),
    );
  }
}
