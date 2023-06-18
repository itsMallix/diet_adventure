import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

const String google_api_key = "AIzaSyDnNrvxUelBjJHXe2PHsQTRdgssqZ_7U0g";

class MapsTest extends StatefulWidget {
  const MapsTest({super.key});

  @override
  State<MapsTest> createState() => _MapsTestState();
}

class _MapsTestState extends State<MapsTest> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng _startPoint = LatLng(-8.167914, 113.722932);
  static const LatLng _endPoint = LatLng(-8.174388, 113.718841);

  List<LatLng> polylineCoordinate = [];
  LocationData? currentLocation;

  void getCurrentLocation() {
    Location location = Location();

    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );
  }

  void getPolyPoint() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(_startPoint.latitude, _startPoint.longitude),
      PointLatLng(_endPoint.latitude, _endPoint.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinate.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    getCurrentLocation();
    getPolyPoint();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Run Tracking",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: currentLocation == null
          ? const Center(child: Text("Loading"))
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _startPoint,
                zoom: 16,
              ),
              polylines: {
                Polyline(
                  polylineId: PolylineId("route"),
                  points: polylineCoordinate,
                  color: Colors.blue,
                  width: 6,
                ),
              },
              markers: {
                Marker(
                  markerId: MarkerId("start"),
                  position: _startPoint,
                ),
                Marker(
                  markerId: MarkerId("end"),
                  position: _endPoint,
                ),
              },
            ),
    );
  }
}
