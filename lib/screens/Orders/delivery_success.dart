import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Color.fromRGBO(252, 126, 87, 1.0),
              size: 125,
              shadows: [
                // Shadow(
                //     color: Color.fromRGBO(252, 126, 87, 0.8),
                //     blurRadius: 10.0,
                //     offset: Offset.fromDirection(11.0))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Order Successfully Delivered",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            Wrap(
              children: const [
                Text(
                  "Order ID:",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "#45214",
                  style: TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                    fixedSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width * 0.9, 60)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(252, 126, 87, 0.9))),
                onPressed: () {},
                child: const Text(
                  "Back Home",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ))
          ],
        ),
      ),
    );
  }
}
