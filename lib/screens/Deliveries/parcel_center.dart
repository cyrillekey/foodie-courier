import 'package:flutter/material.dart';
import 'package:foodie_courier/controllers/parcel_center_provider.dart';
import 'package:foodie_courier/screens/widgets/order_item.dart';
import 'package:foodie_courier/screens/widgets/progress_inidcator.dart';
import 'package:provider/provider.dart';

class ParcelCenter extends StatefulWidget {
  const ParcelCenter({Key? key}) : super(key: key);

  @override
  State<ParcelCenter> createState() => _ParcelCenterState();
}

class _ParcelCenterState extends State<ParcelCenter> {
  @override
  void initState() {
    Provider.of<ParcelCenterProvider>(context, listen: false)
        .getOrdersWithoutCouriers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Consumer<ParcelCenterProvider>(
            builder: (context, parcelCenterProvider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "Parcel Center",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  )),
              const SizedBox(
                height: 30,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "Orders awaiting Driver",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                child: parcelCenterProvider.isLoading
                    ? const CustomIndicator()
                    : ListView.builder(
                        itemCount: parcelCenterProvider.awaiting_drivers.length,
                        itemBuilder: (context, index) {
                          return OrderItem(
                            order_id: parcelCenterProvider
                                .awaiting_drivers[index].order_id
                                .toString(),
                            latitude: parcelCenterProvider
                                .awaiting_drivers[index].latitude,
                            longitude: parcelCenterProvider
                                .awaiting_drivers[index].longitude,
                          );
                        }),
              ),
            ],
          );
        }),
      ),
    );
  }
}
