import 'package:flutter/material.dart';
import 'package:foodie_courier/screens/widgets/order_item.dart';

class MyDeliveries extends StatelessWidget {
  const MyDeliveries({Key? key}) : super(key: key);

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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return const OrderItem();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
