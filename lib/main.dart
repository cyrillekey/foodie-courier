import 'package:background_fetch/background_fetch.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:foodie_courier/controllers/auth_provider.dart';
import 'package:foodie_courier/controllers/delivery_provider.dart';
import 'package:foodie_courier/controllers/order_provider.dart';
import 'package:foodie_courier/controllers/parcel_center_provider.dart';
import 'package:foodie_courier/my_app.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:foodie_courier/services/update_location.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  setupLocator();

  final prefs = await SharedPreferences.getInstance();
  bool onBoarded = prefs.getBool("onboarded") ?? false;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => OrderProvider()),
      ChangeNotifierProvider(create: (_) => ParcelCenterProvider()),
      ChangeNotifierProvider(create: (_) => DeliveryProvider())
    ],
    child: MyApp(
      onBoarded: onBoarded,
    ),
  ));
  BackgroundFetch.registerHeadlessTask(updateCourierLocation);
  FlutterNativeSplash.remove();
}
