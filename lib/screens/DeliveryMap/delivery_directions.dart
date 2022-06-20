import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodie_courier/screens/widgets/progress_inidcator.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryLocation extends StatefulWidget {
  const DeliveryLocation({Key? key}) : super(key: key);

  @override
  State<DeliveryLocation> createState() => _DeliveryLocationState();
}

class _DeliveryLocationState extends State<DeliveryLocation> {
  Position? position;
  void _getUserPosition() async {
    await Geolocator.requestPermission();
    LocationPermission allowed = await Geolocator.checkPermission();
    if (allowed == LocationPermission.deniedForever ||
        allowed == LocationPermission.denied) {
      _getUserPosition();
    } else {
      Position userLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
      logger.e(userLocation);
      setState(() {
        position = userLocation;
      });
    }
  }

  @override
  void initState() {
    _getUserPosition();
    super.initState();
  }

  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: position == null
            ? CustomIndicator()
            : Stack(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: deliveryMap(
                          position: position, controller: _controller)),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 1 / 4,
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(18),
                                topLeft: Radius.circular(18))),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: 60,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Text(
                                              "Order ID",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "-",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "#A45FK",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Jan 06 2020",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade300,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "-",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade300,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "8:30 am",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade300,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    )
                                  ],
                                ),
                              ),
                              Divider()
                            ],
                          ),
                        ),
                      ))
                ],
              ));
  }
}

class deliveryMap extends StatelessWidget {
  const deliveryMap({
    Key? key,
    required this.position,
    required Completer<GoogleMapController> controller,
  })  : _controller = controller,
        super(key: key);

  final Position? position;
  final Completer<GoogleMapController> _controller;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: GoogleMap(
              trafficEnabled: true,
              mapToolbarEnabled: true,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              polylines: <Polyline>{
                Polyline(polylineId: const PolylineId("testin"), points: [
                  const LatLng(-1.248310, 36.664780),
                  LatLng(position!.latitude, position!.longitude)
                ])
              },
              markers: <Marker>{
                Marker(
                    markerId: MarkerId("origin"),
                    position: LatLng(position!.latitude, position!.longitude)),
                Marker(
                    markerId: MarkerId(LatLng(-1.248310, 36.664780).toString()),
                    infoWindow:
                        InfoWindow(title: "Origin", snippet: "Origin marker"),
                    position: const LatLng(-1.248310, 36.664780),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueCyan)),
              },
              onMapCreated: ((controller) {
                _controller.complete(controller);
              }),
              initialCameraPosition: CameraPosition(
                  zoom: 14.0,
                  target: LatLng(position!.latitude, position!.longitude))),
        ),
        Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: CachedNetworkImageProvider(
                                "https://images.pexels.com/photos/5835577/pexels-photo-5835577.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"))),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "John Terry",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "4.89/5",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.phone_callback,
                              size: 18,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("0708073370"),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      print("should launch caller");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(8)),
                      width: 60,
                      height: 60,
                      child: Icon(
                        Icons.phone,
                        size: 35,
                      ),
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
