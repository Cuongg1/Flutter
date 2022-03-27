import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltdd_ack_team/manhinh/chitietbaiviet.dart';
import 'package:ltdd_ack_team/manhinh/chitietdiadanh.dart';
import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViTri extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ViTriState();
  }
}

class ViTriState extends State<ViTri> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Stack(
        children: <Widget>[
          Container(
              child: Stack(
            children: [
              Image.asset('images/vungtau002.jpg'),
              Container(
                  height: 150,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                child: TextButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => ChiTiet()));
                                  },
                                  child: Text(
                                    "Vũng Tàu",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ),
                              Container(
                                  child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Bà Rịa-VũngTàu",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )
                                ],
                              ))
                            ],
                          )
                        ],
                      )
                    ],
                  )),
            ],
          )),
          Container(
            margin: EdgeInsets.only(
              top: 180,
            ),
            height: 650,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: ScreenHomeMap(),
            ),
          ),
        ],
      )),
    );
  }
}

class ScreenHomeMap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScreenHomeMapState();
  }
}

class ScreenHomeMapState extends State<ScreenHomeMap> {
  late GoogleMapController _controller;

  final CameraPosition _initialPosition =
      CameraPosition(target: LatLng(10.6508567, 106.658289));

  final List<Marker> markers = [];

  addMarker(cordinate) {
    int id = Random().nextInt(100);

    setState(() {
      markers
          .add(Marker(position: cordinate, markerId: MarkerId(id.toString())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        mapType: MapType.satellite,
        onMapCreated: (controller) {
          setState(() {
            _controller = controller;
          });
        },
        markers: markers.toSet(),
        onTap: (cordinate) {
          _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
          addMarker(cordinate);
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
