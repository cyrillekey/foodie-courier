import 'package:flutter/material.dart';
import 'package:foodie_courier/controllers/order_provider.dart';
import 'package:foodie_courier/screens/widgets/order_item.dart';
import 'package:foodie_courier/screens/widgets/progress_inidcator.dart';
import 'package:provider/provider.dart';

class MyDeliveries extends StatefulWidget {
  const MyDeliveries({Key? key}) : super(key: key);

  @override
  State<MyDeliveries> createState() => _MyDeliveriesState();
}

class _MyDeliveriesState extends State<MyDeliveries> {
  @override
  void initState() {
    Provider.of<OrderProvider>(context, listen: false).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  "My Deliveries",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                )),
            const SizedBox(
              height: 30,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  "Orders",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                )),
            const SizedBox(
              height: 10,
            ),
            Consumer<OrderProvider>(builder: (context, orderProvider, child) {
              return orderProvider.isLoading
                  ? const CustomIndicator()
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: ListView.builder(
                          itemCount: orderProvider.my_orders.length,
                          itemBuilder: (context, index) {
                            return OrderItem(
                              order_id: orderProvider.my_orders[index].order_id
                                  .toString(),
                              latitude: orderProvider.my_orders[index].latitude,
                              longitude:
                                  orderProvider.my_orders[index].longitude,
                            );
                          }),
                    );
            })
          ],
        ),
      ),
    );
  }
}
