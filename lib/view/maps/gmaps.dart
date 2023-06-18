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
  static const LatLng tryGymJember = LatLng(-8.166493, 113.711726);
  static const LatLng fastClubDietSehat = LatLng(-8.168765, 113.711840);
  static const LatLng sportHallUnej = LatLng(-8.1624913, 113.71451);
  static const LatLng sanggarErmika = LatLng(-8.160631, 113.7141442);
  static const LatLng ammGym = LatLng(-8.164721, 113.724621);
  static const LatLng sanggarGumilang = LatLng(-8.167907, 113.725479);
  static const LatLng bengkelOtot = LatLng(-8.157263, 113.714669);
  static const LatLng nietzGym = LatLng(-8.169349, 113.722629);

  final Map<MarkerId, String> markerName = {
    MarkerId("TryGymJember"): "Try Gym Jember",
    MarkerId("fastClubDietSehat"): "Fast Club Diet Sehat",
    MarkerId("sportHallUnej"): "Sport Hall UNEJ",
    MarkerId("sanggarErmika"): "Sanggar Ermika",
    MarkerId("ammGym"): "AMM Gym",
    MarkerId("sanggarGumilang"): "Sanggar Gumilang",
    MarkerId("bengkelOtot"): "Bengkel Otot",
    MarkerId("nietzGym"): "Nietz Gym",
  };

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

    setState(
      () {
        _markers.add(
          _createMarker("currentPosition", currentPosition, "Current Position"),
        );
        _markers.add(
          _createMarker("tryGymJember", tryGymJember, "Try Gym Jember"),
        );
        _markers.add(
          _createMarker(
              "fastClubDietSehat", fastClubDietSehat, "Fast Club Diet Sehat"),
        );
        _markers.add(
          _createMarker("sportHallUnej", sportHallUnej, "Sport Hall UNEJ"),
        );
        _markers.add(
          _createMarker("sanggarErmika", sanggarErmika, "Sanggar Ermika"),
        );
        _markers.add(
          _createMarker("ammGym", ammGym, "AMM Gym"),
        );
        _markers.add(
          _createMarker("sanggarGumilang", sanggarGumilang, "Sanggar Gumilang"),
        );
        _markers.add(
          _createMarker("bengkelOtot", bengkelOtot, "Bengkel Otot"),
        );
        _markers.add(
          _createMarker("nietzGym", nietzGym, "Nietz Gym"),
        );
      },
    );
  }

  Marker _createMarker(String markerId, LatLng position, String name) {
    return Marker(
      markerId: MarkerId(markerId),
      position: position,
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(title: name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/==>home");
          },
          icon: const Icon(
            Icons.chevron_left_rounded,
            color: DietApp.nearlyBlack,
          ),
        ),
        title: Text(
          'Gym Terdekat',
          style: TextStyle(color: DietApp.darkText),
        ),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(-8.164537075825406, 113.7163977260284),
          zoom: 14.0,
        ),
        markers: _markers,
      ),
    );
  }
}
