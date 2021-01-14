import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart' as Geo;
import 'package:permission_handler/permission_handler.dart';

class PendingOrderDetailsPage extends StatefulWidget {
  static final routeName = '/pending_order_details_page';
  Map data;

  PendingOrderDetailsPage(this.data);

  @override
  _PendingOrderDetailsPageState createState() =>
      _PendingOrderDetailsPageState();
}

class _PendingOrderDetailsPageState extends State<PendingOrderDetailsPage> {
  GoogleMapController _mapController;
  Geo.Position _currentPosition;

/*Setting markers to show user location[red/default] and order location[blue]
* @WNIA
* */
  Set<Marker> _createMarker() {
    try {
      return <Marker>[
        Marker(
            markerId: MarkerId("my location"),
            position:
                LatLng(_currentPosition.latitude, _currentPosition.longitude),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(title: "Home")),
        Marker(
            markerId: MarkerId("order location"),
            position: LatLng(
                widget.data["OrderLatitude"], widget.data['OrderLongitude']),
            icon: BitmapDescriptor.defaultMarkerWithHue(220),
            infoWindow: InfoWindow(title: "Order"))
      ].toSet();
    } catch (e) {
      print(e);
    }
  }

  _mapCreated(GoogleMapController controller) {
    controller = _mapController;
  }

/*requesting for permission to read the device location
* @WNIA*/
  Future<void> requestPermission() async {
    var permission = await Permission.location.request();
    print(permission);
  }

/*fetching user's current location using geolocator
fetching route from user location to order location
* @WNIA*/
  void getCurrentLocationAndRoute() async {
    Geo.Position pos = await Geo.Geolocator.getCurrentPosition(
        desiredAccuracy: Geo.LocationAccuracy.best);
    setState(() {
      _currentPosition = pos;
    });
  }

/*fetching user's current location using Geolocator
* requesting for permission to read the device location
* @WNIA
* */
  @override
  void initState() {
    requestPermission();
    getCurrentLocationAndRoute();
    super.initState();
  }

  // Marker startMarker = Marker(markerId: MarkerId('$startMarker'),
  //   position: LatLng(_currentPosition.latitude, _currentPosition.longitude);
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text('New Delivery Task', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: GoogleMap(
            // markers: _markerList.toSet(),
            onMapCreated: _mapCreated,
            markers: _createMarker(),
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              zoom: 12.0,
              target: LatLng(
                  widget.data["OrderLatitude"], widget.data["OrderLongitude"]),
            )));
  }
}
