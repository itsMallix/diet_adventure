import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:diet_app/theme/t_theme.dart';

class GoogleMapsPage extends StatefulWidget {
  @override
  _GoogleMapsPageState createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  final Set<Marker> _markers = {};

  @override
  void initState() {
    requestPermission(); // Meminta izin akses lokasi
    super.initState();
  }

  void requestPermission() async {
    PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      getCurrentLocation(); // Mendapatkan lokasi terkini jika izin diberikan
    } else if (status.isDenied) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Location Permission Denied'),
          content: Text('Please grant location permission to access the map.'),
          actions: [
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  void getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    LatLng currentPosition = LatLng(position.latitude, position.longitude);

    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("currentPosition"),
          position: currentPosition,
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Google Maps Flutter',
          style: TextStyle(color: DietApp.darkText),
        ),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(-8.164404396869179, 113.71851978276597),
          zoom: 14.0,
        ),
        markers: _markers,
        onTap: (position) {
          setState(() {
            _markers.add(
              Marker(
                markerId:
                    MarkerId("${position.latitude}, ${position.longitude}"),
                icon: BitmapDescriptor.defaultMarker,
                position: position,
              ),
            );
          });
        },
      ),
    );
  }
}
