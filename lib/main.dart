import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:foodie_courier/my_app.dart';
import 'package:foodie_courier/screens/Authentication/sign_in.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  setupLocator();
  runApp(MultiProvider(
    providers: [],
    child: const SignIn(),
  ));
  FlutterNativeSplash.remove();
}
