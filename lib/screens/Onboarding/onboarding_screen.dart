import 'package:flutter/material.dart';
import 'package:foodie_courier/screens/Authentication/login_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      bodyPadding: EdgeInsets.only(top: 20, left: 20, right: 20),
      titlePadding: EdgeInsets.only(top: 50),
    );
  }

  void setViewOnboarded() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("onboarded", true);
  }

  @override
  void initState() {
    _pages = [
      PageViewModel(
          decoration: getPagedDecoration(),
          title: "Choose a Favourite Food",
          body:
              "When you oder Eat Steet, we’ll hook you up with exclusive coupon, specials and rewards",
          image: Center(
            child: Image.asset(
              ("assets/img/hot_delivery.png"),
              fit: BoxFit.contain,
            ),
          )),
      PageViewModel(
          decoration: getPagedDecoration(),
          title: "Hot Delivery to Home",
          body:
              "We make food ordering fast, simple and free-no matter if you order online or cash",
          image: Center(
            child: Image.asset(
              ("assets/img/favourite_food.png"),
              fit: BoxFit.contain,
            ),
          )),
      PageViewModel(
          decoration: getPagedDecoration(),
          title: "Receive the Great Food",
          body:
              "You’ll receive the great food within a hour. And get free delivery credits for every order.",
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
      done: const Text("Done"),
      next: const Text("Next"),
      showNextButton: true,
      showSkipButton: true,
      skip: const Text("Skip"),
      onDone: () {
        setViewOnboarded();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
    ));
  }
}
