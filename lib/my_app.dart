import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:foodie_courier/controllers/auth_provider.dart';
import 'package:foodie_courier/screens/Authentication/login_screen.dart';
import 'package:foodie_courier/screens/Layout/main_layout.dart';
import 'package:foodie_courier/screens/Onboarding/onboarding_screen.dart';
import 'package:foodie_courier/services/push_notification_service.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:foodie_courier/services/update_location.dart';
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
    initPlatformState();
    super.initState();
  }

  Future<void> initPlatformState() async {
    int status = await BackgroundFetch.configure(
        BackgroundFetchConfig(
            minimumFetchInterval: 15,
            enableHeadless: true,
            startOnBoot: true,
            stopOnTerminate: false,
            requiredNetworkType: NetworkType.ANY,
            requiresBatteryNotLow: false,
            requiresCharging: false,
            requiresDeviceIdle: false,
            requiresStorageNotLow: false), (String taskId) async {
      logger.d("Backgorund event $taskId received");
      updateLocationForeground();
      BackgroundFetch.finish(taskId);
    }, (String taskId) async {
      logger.e("Background task has timed out");
      BackgroundFetch.finish(taskId);
    });
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
