import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:foodie_courier/services/service_locator.dart';

var flutterNotification = FlutterLocalNotificationsPlugin();
Future<void> _handlingFirebaseBackgroungMessage(RemoteMessage message) async {
  logger.i("Handling background message: ${message.messageId}");
  PushNotificationService.myBackgroundMessageHandler(message.data);
}

class PushNotificationService {
  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) async {
    return Future<void>.value();
  }

  void oninit() {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings("@mipmap/launcher_icon");
    var initializeIosSetttings = const IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializeIosSetttings);
    flutterNotification.initialize(initializationSettings,
        onSelectNotification: onSelect);
    FirebaseMessaging.onMessage.listen((event) async {
      logger.i("on message: $event");
      handleNotificationMessages(event.data);
    });
    FirebaseMessaging.onBackgroundMessage(_handlingFirebaseBackgroungMessage);
    FirebaseMessaging.instance.getToken().then((value) async {
      //TODO implement api to send fcm token to database
    });
  }

  static initEvents() async {}
  static handleNotificationMessages(Map<String, dynamic> message) {}
  Future<String?> onSelect(String? itm) async {}
}
