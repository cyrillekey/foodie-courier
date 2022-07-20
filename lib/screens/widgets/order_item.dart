import 'package:flutter/material.dart';
import 'package:foodie_courier/screens/DeliveryMap/delivery_directions.dart';
import 'package:foodie_courier/screens/Orders/order_details.dart';
import 'package:foodie_courier/services/update_location.dart';

class OrderItem extends StatelessWidget {
  final String order_id;
  final double latitude;
  final double longitude;
  const OrderItem({
    Key? key,
    required this.order_id,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // getAddressName(latitude.toString(), longitude.toString());
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 174,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Row(
                children: [
                  const Text(
                    "Order Id",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "#$order_id",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Row(
                children: const [
                  Icon(Icons.location_on),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: Text(
                      "23/A Block Sector 4, Kiambu, Kikuyu, 24km",
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                    style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(140, 40)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderDetails(
                                    order_id: order_id,
                                  )));
                    },
                    child: const Text(
                      "View Order",
                      style: TextStyle(color: Colors.black),
                    )),
                OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(252, 106, 87, 0.8)),
                        fixedSize:
                            MaterialStateProperty.all(const Size(140, 40)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeliveryLocation(
                                    order_id: order_id,
                                  )));
                    },
                    child: const Text(
                      "View Direction",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
