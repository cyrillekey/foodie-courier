import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScanner extends StatelessWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                elevation: 4,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.50,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: MobileScanner(
                                          allowDuplicates: false,
                                          onDetect: ((barcode, args) {})),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 0.0,
                                      left: 0.0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(24),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.flash_on,
                                            color: Colors.white,
                                            size: 36,
                                          ),
                                          alignment: Alignment.center,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Qr Code",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Exmaple"),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Chip(
                                  label: Text("exmaple"),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.camera),
                                  label: const Text("label"),
                                  style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      primary: Theme.of(context).primaryColor,
                                      side: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.camera),
                                  label: const Text("label"),
                                  style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      primary: Theme.of(context).primaryColor,
                                      side: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: TextButton(
                            autofocus: false,
                            style: TextButton.styleFrom(
                                primary: Theme.of(context).primaryColor),
                            onPressed: () {},
                            child: const Icon(Icons.clear)))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
