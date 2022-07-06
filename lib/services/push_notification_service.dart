import 'dart:convert';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:foodie_courier/api_client/api_client.dart';
import 'package:foodie_courier/services/service_locator.dart';

import '../models/user_model.dart';

var flutterNotification = FlutterLocalNotificationsPlugin();
Future<void> _handlingFirebaseBackgroungMessage(RemoteMessage message) async {
  logger.i("Handling background message: ${message.messageId}");
  PushNotificationService.myBackgroundMessageHandler(message.data);
}

class PushNotificationService {
  late User? user;
  final _apiClient = locator<ApiClient>();
  PushNotificationService(this.user);
  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) async {
    return Future<void>.value();
  }

  void oninit() {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
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
      if (user != null) {
        _apiClient.post("update-fcm-token/${user!.customer_id}",
            data: {"token": value});
      }
    });
  }

  static initEvents() async {}
  static handleNotificationMessages(Map<String, dynamic> message) {
    logger.i("Handling background message");
    var data = message;
    var action = data['action'];
    String? title = "";
    String? msg = "";

    if (title != "" && msg != "") {
      BigTextStyleInformation bigTextStyleInformation =
          BigTextStyleInformation(msg, contentTitle: title);
      var androidPlaformChannelsSpecific = AndroidNotificationDetails(
          'foodie_courier', 'foodie_courier',
          channelDescription: 'foodie_courier',
          color: Colors.primaries[0],
          importance: Importance.max,
          priority: Priority.high,
          styleInformation: bigTextStyleInformation,
          ticker: title);
      var iosPlaformChannelSpecific = const IOSNotificationDetails();
      var platformChannelsSpecific = NotificationDetails(
          android: androidPlaformChannelsSpecific,
          iOS: iosPlaformChannelSpecific);
      flutterNotification.show(
          Random().nextInt(100000), title, msg, platformChannelsSpecific,
          payload: json.encode(message));
    }
  }

  Future<String?> onSelect(String? itm) async {
    return "";
  }
}
