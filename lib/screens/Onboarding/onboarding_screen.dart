import 'package:flutter/material.dart';
import 'package:foodie_courier/screens/Layout/main_layout.dart';
import 'package:geolocator/geolocator.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  Future<bool> _getUserPosition() async {
    await Geolocator.requestPermission();
    LocationPermission allowed = await Geolocator.checkPermission();
    if (allowed == LocationPermission.deniedForever ||
        allowed == LocationPermission.denied) {
      return false;
    } else {
      return true;
    }
  }

  final List<PageViewModel> _pages = [
    PageViewModel(
        title: "Deliver Foods country wide",
        body: "Deliver ajs na mam",
        image: Center(
          child: Image.asset(
            ("assets/img/hot_delivery.png"),
            fit: BoxFit.contain,
          ),
        )),
    PageViewModel(
        title: "Deliver Foods country wide",
        body: "Deliver ajs na mam",
        image: Center(
          child: Image.asset(
            ("assets/img/favourite_food.png"),
            fit: BoxFit.contain,
          ),
        )),
    PageViewModel(
        title: "Deliver Foods country wide",
        body: "Deliver ajs na mam",
        image: Center(
          child: Image.asset(
            ("assets/img/great_food.png"),
            fit: BoxFit.contain,
          ),
        ))
  ];
  @override
  void initState() {
    super.initState();
    _getUserPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      pages: _pages,
      done: Text("Done"),
      next: Text("Next"),
      showNextButton: true,
      showSkipButton: true,
      skip: Text("Skip"),
      onDone: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MainLayout(index: 0)));
      },
    ));
  }
}
