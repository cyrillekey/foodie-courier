import 'package:flutter/material.dart';
import 'package:foodie_courier/controllers/auth_provider.dart';
import 'package:foodie_courier/screens/Authentication/login_screen.dart';
import 'package:foodie_courier/screens/Authentication/sign_in.dart';
import 'package:foodie_courier/screens/Home/home.dart';
import 'package:foodie_courier/screens/Layout/main_layout.dart';
import 'package:foodie_courier/screens/Onboarding/onboarding_screen.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? onBoarded = false;

  checkOnboarded() async {
    final prefs = await SharedPreferences.getInstance();
    onBoarded = prefs.getBool("onboarded");
  }

  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).onInit();
    super.initState();
    checkOnboarded();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Consumer<AuthProvider>(builder: (context, authProvider, child) {
        Widget home;
        if (onBoarded == true) {
          if (authProvider.currentUser != null) {
            home = const MainLayout(index: 0);
          } else {
            home = SignIn();
          }
        } else {
          home = const OnBoardingScreen();
        }

        return home;
      }),
    );
  }
}
