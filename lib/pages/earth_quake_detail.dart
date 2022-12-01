import 'dart:async';

import 'package:deprem_bilgi/models/earth_quake_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EarthQuakeDetail extends StatefulWidget {
  EarthQuakeListModel _earthQuakeListModel = EarthQuakeListModel();

  EarthQuakeDetail(this._earthQuakeListModel);

  @override
  State<EarthQuakeDetail> createState() => _EarthQuakeDetailState();
}

class _EarthQuakeDetailState extends State<EarthQuakeDetail> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> markers = new Set(); //markers for google map

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget._earthQuakeListModel.lokasyon.toString(),
          style: TextStyle(fontSize: 12),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Card(
            color: Colors.black,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 400,
                  child: GoogleMap(
                    markers: getmarkers(), //markers to show on map
                    mapType: MapType.hybrid,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                          widget._earthQuakeListModel.lat!.toDouble(),
                          widget._earthQuakeListModel.lng!.toDouble()),
                      zoom: 14.4746,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Merkez Üssü: ${widget._earthQuakeListModel.lokasyon}',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Şiddeti: ${widget._earthQuakeListModel.mag}',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Derinlik: ${widget._earthQuakeListModel.depth}',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Tarih: ${widget._earthQuakeListModel.date}',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Enlem-Boylam: ${widget._earthQuakeListModel.lat} - ${widget._earthQuakeListModel.lng}',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ),
          decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.black,
                blurRadius: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Set<Marker> getmarkers() {
    setState(() {
      markers.add(Marker(
        //add first marker
        markerId: MarkerId(LatLng(widget._earthQuakeListModel.lat!.toDouble(),
                widget._earthQuakeListModel.lng!.toDouble())
            .toString()),
        position: LatLng(widget._earthQuakeListModel.lat!.toDouble(),
            widget._earthQuakeListModel.lng!.toDouble()), //position of marker
        infoWindow: InfoWindow(
          title: widget._earthQuakeListModel.lokasyon,
          snippet: widget._earthQuakeListModel.mag.toString(),
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    });
    return markers;
  }
}
