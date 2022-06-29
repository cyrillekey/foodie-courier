import 'package:flutter/material.dart';
import 'package:foodie_courier/controllers/auth_provider.dart';
import 'package:foodie_courier/screens/Authentication/login_screen.dart';
import 'package:foodie_courier/screens/Layout/main_layout.dart';
import 'package:foodie_courier/screens/Onboarding/onboarding_screen.dart';
import 'package:foodie_courier/services/push_notification_service.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  final bool onBoarded;
  MyApp({Key? key, required this.onBoarded}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: "Main Navigator");
  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodie Courier App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Consumer<AuthProvider>(builder: (context, authProvider, child) {
        Widget home;
        PushNotificationService(authProvider.currentUser).oninit();
        if (widget.onBoarded == true) {
          if (authProvider.currentUser != null) {
            home = const MainLayout(index: 0);
          } else {
            home = LoginScreen();
          }
        } else {
          home = const OnBoardingScreen();
        }

        return home;
      }),
    );
  }
}
