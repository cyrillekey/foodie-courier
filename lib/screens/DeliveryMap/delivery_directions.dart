import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodie_courier/controllers/delivery_provider.dart';
import 'package:foodie_courier/models/order_model.dart';
import 'package:foodie_courier/models/user_model.dart';
import 'package:foodie_courier/screens/widgets/progress_inidcator.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryLocation extends StatefulWidget {
  final String order_id;
  const DeliveryLocation({Key? key, required this.order_id}) : super(key: key);

  @override
  State<DeliveryLocation> createState() => _DeliveryLocationState();
}

class _DeliveryLocationState extends State<DeliveryLocation> {
  @override
  void initState() {
    Provider.of<DeliveryProvider>(context, listen: false).init(widget.order_id);
    super.initState();
  }

  Completer<GoogleMapController> controller = Completer();
  @override
  Widget build(BuildContext context) {
    return Consumer<DeliveryProvider>(
        builder: (context, deliveryProvider, child) {
      return Scaffold(
          body: deliveryProvider.isLoading
              ? const CustomIndicator()
              : Stack(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: deliveryMap(
                          position: deliveryProvider.position,
                          controller: controller,
                          order: deliveryProvider.order,
                          customer: deliveryProvider.user!,
                        )),
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
                                            children: [
                                              const Text(
                                                "Order ID",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Text(
                                                "-",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "#${deliveryProvider.order?.order_id}",
                                                style: const TextStyle(
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
    });
  }
}

class deliveryMap extends StatelessWidget {
  const deliveryMap({
    Key? key,
    required this.position,
    required Completer<GoogleMapController> controller,
    this.order,
    required this.customer,
  })  : _controller = controller,
        super(key: key);

  final Position? position;
  final Order? order;
  final User customer;
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
                  LatLng(order!.latitude, order!.longitude),
                  LatLng(position!.latitude, position!.longitude)
                ])
              },
              markers: <Marker>{
                Marker(
                    markerId: MarkerId(
                        LatLng(order!.latitude, order!.longitude).toString()),
                    infoWindow: const InfoWindow(
                        title: "Delivery Location",
                        snippet: "You Are Delivering Goods Here"),
                    position: LatLng(order!.latitude, order!.longitude),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueCyan)),
                Marker(
                    markerId: const MarkerId("origin"),
                    position: LatLng(position!.latitude, position!.longitude),
                    infoWindow: const InfoWindow(
                        title: "My Location",
                        snippet: "You Are Currently Here")),
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
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: CachedNetworkImageProvider(
                                customer.profile_picture,
                                errorListener: () {}))),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 140,
                          child: Text(
                            customer.user_name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
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
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.phone_callback,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(customer.user_phone),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      final Uri url =
                          Uri(scheme: 'tel', path: customer.user_phone);
                      await launchUrl(url);
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
