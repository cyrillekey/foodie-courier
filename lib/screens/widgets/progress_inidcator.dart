import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        height: 65,
        width: 65,
        child: Stack(
          children: [
            Image.asset(
              "assets/img/logo_01.png",
              fit: BoxFit.fill,
            ),
            Center(
              child: Transform.scale(
                scale: 2.4,
                child: const CircularProgressIndicator(
                  strokeWidth: 4,
                  backgroundColor: Colors.white,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
