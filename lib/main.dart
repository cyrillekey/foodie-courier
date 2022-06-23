import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:foodie_courier/controllers/auth_provider.dart';
import 'package:foodie_courier/my_app.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:foodie_courier/services/update_location.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  setupLocator();

  final prefs = await SharedPreferences.getInstance();
  bool onBoarded = await prefs.getBool("onboarded") ?? false;

  // if (defaultTargetPlatform == TargetPlatform.android) {
  //   AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  // }
  Workmanager().initialize(updateCourierLocation, isInDebugMode: false);
  Workmanager().registerPeriodicTask("1", "fetchBackground",
      frequency: Duration(minutes: 15));
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
    child: MyApp(
      onBoarded: onBoarded,
    ),
  ));
  FlutterNativeSplash.remove();
}
