import 'package:delivering_app/controller/Providers/check_out_provider.dart';
import 'package:delivering_app/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class CustomGoogleMap extends StatefulWidget {
  CustomGoogleMap({Key? key}) : super(key: key);

  @override
  State<CustomGoogleMap> createState() => _GoogleMapState();
}

class _GoogleMapState extends State<CustomGoogleMap> {
  LatLng _initialCameraPosition = LatLng(23.777176, 90.399452);

  late GoogleMapController controller;
  Location _location = Location();

  void _onMapCreated(GoogleMapController value) {
    controller = value;
    _location.onLocationChanged.listen((event) {
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            event.latitude!,
            event.longitude!,
          ),
          zoom: 15,
        ),
      ));
    });
  }

  // void getLocation() async {
  //   var location = await _location.getLocation();
  //   _location.enableBackgroundMode(enable: true);
  //   _location.onLocationChanged.listen((LocationData loc) {
  //     controller
  //         ?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
  //       target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
  //       zoom: 15.0,
  //     )));
  //     print(loc.latitude);
  //     print(loc.longitude);
  //     setState(() {
  //       LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0);
  //     });
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getLocation();
  // }

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: _initialCameraPosition),
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
                // myLocationButtonEnabled: true,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin:
                      EdgeInsets.only(right: 60, left: 10, bottom: 40, top: 40),
                  child: MaterialButton(
                    onPressed: () async {
                      await _location.getLocation().then((value) {
                        checkoutProvider.setLocation = value;
                      });
                      Get.back();
                    },
                    color: primaryColour,
                    child: Text('Set Location'),
                    shape: StadiumBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
