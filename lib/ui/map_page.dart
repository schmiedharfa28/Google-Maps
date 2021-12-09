import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MapPage> {
  final LatLng rumah = LatLng(-0.9433208338184803, 100.40728416784549);
  final LatLng udacoding = LatLng(-6.2969516, 106.6984811);
  final LatLng pantaiancol = LatLng(-6.119024810259329, 106.85023544011754);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map Flutter"),
      ),
      body: ListView(
        children: <Widget>[
          MyMap(
            location: udacoding,
            title: 'Udacoding',
          ),
          MyMap(
            location: pantaiancol,
            title: 'Pantai Ancol',
          ),
          MyMap(
            location: rumah,
            title: 'Rumah',
          ),
        ],
      ),
    );
  }
}

class MyMap extends StatelessWidget {
  const MyMap({Key? key, required this.location, this.title}) : super(key: key);

  final LatLng location;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            Text(
              title!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Center(
              child: SizedBox(
                width: 800.0,
                height: 500.0,
                child: GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: location, zoom: 11.0),
                  markers: <Marker>[
                    Marker(
                      markerId: MarkerId(title!),
                      position: location,
                      infoWindow: InfoWindow(
                        title: title,
                      ),
                    ),
                  ].toSet(),
                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                    Factory<OneSequenceGestureRecognizer>(
                        () => ScaleGestureRecognizer()),
                  ].toSet(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
