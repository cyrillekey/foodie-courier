import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:foodie_courier/controllers/auth_provider.dart';
import 'package:foodie_courier/controllers/delivery_provider.dart';
import 'package:foodie_courier/controllers/order_provider.dart';
import 'package:foodie_courier/controllers/parcel_center_provider.dart';
import 'package:foodie_courier/my_app.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  setupLocator();
  final prefs = await SharedPreferences.getInstance();
  bool onBoarded = prefs.getBool("onboarded") ?? false;
  Workmanager().initialize(
    callBackDispathcer,
    isInDebugMode: true,
  );
  Workmanager().registerPeriodicTask(
    "updateLocationBackgroundCourier",
    "updateLocation",
    frequency: const Duration(minutes: 15),
    constraints: Constraints(networkType: NetworkType.connected),
  );
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
  // BackgroundFetch.registerHeadlessTask(updateCourierLocation);
  FlutterNativeSplash.remove();
}

@pragma('vm:entry-point')
void callBackDispathcer() {
  Workmanager().executeTask((updateLocation, inputData) async {
    final prefs = await SharedPreferences.getInstance();
    String? courier = prefs.getString("courier");
    String? token = prefs.getString("token");

    if (token == null || courier == null) {
      return Future.error("Courier or token not setup");
    }
    Position position = await Geolocator.getCurrentPosition();
    try {
      logger.i("im called");
      await http.post(
          Uri.parse(
              "https://foodieback.herokuapp.com/courier/update-location/$courier"),
          headers: {
            "Authorization": "Bearer $token",
            'Content-Type': 'application/json'
          },
          body: jsonEncode({
            'latitude': position.latitude,
            'longitude': position.longitude,
          }));
      return Future.value(true);
    } on DioError catch (err) {
      return Future.value(false);
    } catch (err) {
      return Future.value(false);
    }
    // return Geolocator.getCurrentPosition(
    //         desiredAccuracy: LocationAccuracy.bestForNavigation)
    //     .then((value) {
    //   logger.i(value);
    //   try {
    //     logger.i("im called");
    //     http.post(
    //         Uri.parse(
    //             "https://foodieback.herokuapp.com/courier/update-location/$courier"),
    //         headers: {
    //           "Authorization": "Bearer $token",
    //           'Content-Type': 'application/json'
    //         },
    //         body: jsonEncode({
    //           'latitude': value.latitude,
    //           'longitude': value.longitude,
    //         }));
    //     return Future.value(true);
    //   } on DioError catch (err) {
    //     return Future.value(false);
    //   } catch (err) {
    //     return Future.value(false);
    //   }
    // }).catchError((err) {
    //   return Future.value(false);
    // });
  });
}
