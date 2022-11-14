import 'package:flutter/material.dart';
import 'package:googlemap/google_search_places_api.dart';
import 'package:googlemap/map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: map(),
      home: GoogleSearchPlacesApi(),
    );
  }
}
