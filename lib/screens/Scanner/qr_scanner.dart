import 'package:flutter/material.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScanner extends StatelessWidget {
  const QrScanner({Key? key}) : super(key: key);

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
                child: MobileScanner(onDetect: (Barcode code, ars) {
                  logger.i(code);
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
                      children: [Text("Scann to accetp Payment")],
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
                            onPressed: () {},
                            icon: const Icon(Icons.info))
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
