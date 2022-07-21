// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodie_courier/controllers/order_provider.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

import '../../api_client/api_response.dart';
import '../Orders/delivery_success.dart';
import '../widgets/Alerts.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  MobileScannerController _controller = MobileScannerController();
  String? code;
  bool busy = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                child: MobileScanner(
                    controller: _controller,
                    allowDuplicates: false,
                    onDetect: (Barcode code, ars) {
                      setState(() {
                        this.code = code.rawValue!;
                      });
                    }),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("Scan to accept Payment"),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Code: $code",
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: !busy && code != null
                              ? () async {
                                  setState(() {
                                    busy = true;
                                  });
                                  ApiResponse response =
                                      await Provider.of<OrderProvider>(context,
                                              listen: false)
                                          .deliverOrder(code!.trim());
                                  if (response.isSuccess) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Success()));
                                  } else {
                                    Alert.showCustomSnackbar(
                                        context, "${response.message}",
                                        isSuccess: false);
                                  }
                                  setState(() {
                                    busy = false;
                                  });
                                }
                              : null,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      offset: const Offset(2, 4),
                                      blurRadius: 5,
                                      spreadRadius: 2)
                                ],
                                gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xfffbb448),
                                      Color(0xfff7892b)
                                    ])),
                            child: busy
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Submit",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                          ),
                        )
                      ],
                    ),
                  )),
              Positioned(
                  top: 20,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close_outlined)),
                        const Text(
                          "Scan To Accept",
                          style: TextStyle(color: Colors.white),
                        ),
                        IconButton(
                            highlightColor: Colors.white54,
                            iconSize: 35,
                            color: Colors.white,
                            onPressed: () => _controller.toggleTorch(),
                            icon: ValueListenableBuilder(
                                valueListenable: _controller.torchState,
                                builder: (context, state, child) {
                                  switch (state as TorchState) {
                                    case TorchState.off:
                                      return const Icon(Icons.flash_off);
                                    case TorchState.on:
                                      return const Icon(Icons.flash_on);
                                  }
                                }))
                      ],
                    ),
                  )),
              Positioned(
                  top: MediaQuery.of(context).size.height * .20,
                  left: MediaQuery.of(context).size.width * 0.10,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                  ))
            ],
          )),
    );
  }
}
