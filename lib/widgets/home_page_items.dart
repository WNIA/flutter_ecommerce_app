import 'package:autism_project_demo_2/helper/constants.dart';
import 'package:autism_project_demo_2/widgets/last_five_sales_chart.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'appbar_widget.dart';
import 'box_deco_widget.dart';

class HomePageItems extends StatefulWidget {
  @override
  _HomePageItemsState createState() => _HomePageItemsState();
}

class _HomePageItemsState extends State<HomePageItems> {
  GoogleMapController _controller;
  Position _currentPosition;

  @override
  void initState() {
    super.initState();
    getCurrentLatLng();
  }

  void getCurrentLatLng() async {
    Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    setState(() {
      _currentPosition = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMain(context, "Home"),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView(children: [
            Container(
              height: 80,
              decoration: boxDeco(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${Constants.numOfPendingOrders}',
                          style: orderSummaryTextStyle()),
                      Text('Pending', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${Constants.numOfProcessing}',
                          style: orderSummaryTextStyle()),
                      Text('Processing', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${Constants.numOfDelivered}',
                          style: orderSummaryTextStyle()),
                      Text('Delivered', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Container(
                height: 300,
                width: double.infinity,
                decoration: boxDeco(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Last Five Sales Chart'),
                      Expanded(child: LastFiveSalesChart()),
                    ],
                  ),
                )),
            SizedBox(height: 8.0),
            _currentPosition != null
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        zoom: 10.0,
                        target: LatLng(_currentPosition.latitude,
                            _currentPosition.longitude),
                      ),
                      onMapCreated: _mapCreated,
                      markers: _createMarker(),
                    ),
                  )
                : Container(),
          ]),
        ));
  }

  _mapCreated(GoogleMapController controller) {
    controller = _controller;
  }
  Set<Marker> _createMarker() {
    try {
      return <Marker>[
        Marker(
            markerId: MarkerId("my location"),
            position:
            LatLng(_currentPosition.latitude, _currentPosition.longitude),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(title: "Home")),
      ].toSet();
    } catch (e) {
      print(e);
    }
  }


  TextStyle orderSummaryTextStyle() {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
  }
}
