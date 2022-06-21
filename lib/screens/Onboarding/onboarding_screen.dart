import 'package:flutter/material.dart';
import 'package:foodie_courier/screens/Authentication/sign_in.dart';
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

  List<PageViewModel> _pages = List.empty();

  PageDecoration getPagedDecoration() {
    return const PageDecoration(
      imagePadding: EdgeInsets.only(top: 120),
      bodyPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
      titlePadding: EdgeInsets.only(top: 50),
    );
  }

  @override
  void initState() {
    _pages = [
      PageViewModel(
          decoration: getPagedDecoration(),
          title: "Deliver Foods country wide",
          body: "Deliver ajs na mam",
          image: Center(
            child: Image.asset(
              ("assets/img/hot_delivery.png"),
              fit: BoxFit.contain,
            ),
          )),
      PageViewModel(
          decoration: getPagedDecoration(),
          title: "Deliver Foods country wide",
          body: "Deliver ajs na mam",
          image: Center(
            child: Image.asset(
              ("assets/img/favourite_food.png"),
              fit: BoxFit.contain,
            ),
          )),
      PageViewModel(
          decoration: getPagedDecoration(),
          title: "Deliver Foods country wide",
          body: "Deliver ajs na mam",
          image: Center(
            child: Image.asset(
              ("assets/img/great_food.png"),
              fit: BoxFit.contain,
            ),
          ))
    ];
    _getUserPosition();
    super.initState();
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      },
    ));
  }
}
