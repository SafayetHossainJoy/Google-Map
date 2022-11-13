import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class map extends StatefulWidget {
  const map({super.key});

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(23.710400, 90.407440),
    zoom: 14.4746,
  );

  List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(23.710400, 90.407440),
        infoWindow: InfoWindow(title: 'My current Location')),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(23.819318, 90.426981),
        infoWindow: InfoWindow(title: 'E-5 road')),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(23.859464, 90.40222),
        infoWindow: InfoWindow(title: 'F-4 road')),
  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
            mapType: MapType.normal,
            compassEnabled: false,
            myLocationEnabled: true,
            initialCameraPosition: _kGooglePlex,
            markers: Set<Marker>.of(_marker),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_disabled_outlined),
        onPressed: () async {
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: LatLng(23.867649, 90.393958), zoom: 14)));
          setState(() {});
        },
      ),
    );
  }
}
