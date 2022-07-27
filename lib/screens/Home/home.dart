// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodie_courier/api_client/api_response.dart';
import 'package:foodie_courier/controllers/auth_provider.dart';
import 'package:foodie_courier/controllers/order_provider.dart';
import 'package:foodie_courier/models/user_model.dart';
import 'package:foodie_courier/screens/Orders/delivery_success.dart';
import 'package:foodie_courier/screens/Scanner/qr_scanner.dart';
import 'package:foodie_courier/screens/widgets/Alerts.dart';
import 'package:foodie_courier/screens/widgets/order_item.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:foodie_courier/services/update_location.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).onInit();
    Provider.of<OrderProvider>(context, listen: false).init();
  }

  final TextEditingController _codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool busy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16)),
                    color: Color.fromRGBO(255, 214, 77, 1.0)),
                child: Column(children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Foodie Courier",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: CachedNetworkImageProvider(Provider
                                      .of<AuthProvider>(context)
                                  .currentUser
                                  ?.profile_picture ??
                              "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250"),
                        )
                      ]),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter parcel number or scan qr code",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Form(
                          key: _formKey,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Code Cannot Be Empty';
                                      }
                                      return null;
                                    },
                                    controller: _codeController,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 0,
                                                style: BorderStyle.none),
                                            borderRadius:
                                                BorderRadius.circular(6))),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const QrScanner()));
                                  },
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white),
                                    width: 60,
                                    child: const Icon(
                                      Icons.qr_code_outlined,
                                      size: 35,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(Size(
                              MediaQuery.of(context).size.width * 0.8, 60)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black)),
                      onPressed: !busy
                          ? () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  busy = true;
                                });
                                ApiResponse response = await Provider.of<
                                        OrderProvider>(context, listen: false)
                                    .deliverOrder(_codeController.text.trim());
                                if (response.isSuccess) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Success()));
                                } else {
                                  Alert.showCustomSnackbar(
                                      context, "${response.message}",
                                      isSuccess: false);
                                }
                                setState(() {
                                  busy = false;
                                });
                              }
                            }
                          : null,
                      child: !busy
                          ? const Text(
                              "Deliver Parcel",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            )
                          : const CircularProgressIndicator(
                              color: Colors.white,
                            ))
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: const Text(
                  "My Current Order",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                height: MediaQuery.of(context).size.height * 0.25,
                child: Consumer<OrderProvider>(
                    builder: (context, orderProvider, child) {
                  return orderProvider.pending_orders.isNotEmpty
                      ? ListView.builder(
                          itemCount: orderProvider.pending_orders.length,
                          itemBuilder: (context, index) {
                            return orderProvider.isLoading
                                ? Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    height: 174,
                                    width: MediaQuery.of(context).size.width,
                                    child: Shimmer.fromColors(
                                        baseColor: Colors.grey[400]!,
                                        highlightColor: Colors.grey[500]!,
                                        child: const Card()),
                                  )
                                : OrderItem(
                                    order_id: orderProvider
                                        .pending_orders[index].order_id
                                        .toString(),
                                    latitude: orderProvider
                                        .pending_orders[index].latitude,
                                    longitude: orderProvider
                                        .pending_orders[index].latitude,
                                  );
                          })
                      : Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    "assets/img/empty.jpg",
                                  ),
                                  fit: BoxFit.fill)),
                          child: const Text(
                            "No Orders",
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 35,
                                fontWeight: FontWeight.w700),
                          ),
                        );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
