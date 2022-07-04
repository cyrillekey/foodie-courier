import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:foodie_courier/api_client/api_client.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

const fetchBackground = "fetchBackground";

void updateCourierLocation() {
  Workmanager().executeTask((taskName, inputData) async {
    final prefs = await SharedPreferences.getInstance();
    String? courier = prefs.getString("courier");
    String? token = prefs.getString("token");
    if (courier != null && token != null) {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.bestForNavigation)
          .then((value) {
        logger.i(value);
        updateRequest(token, courier, value.latitude, value.longitude);
        // Dio()
        //     .post(
        //         "https://foodieback.herokuapp.com/courier/update-location/$courier",
        //         options: Options(
        //           headers: {
        //             "Authorization": "Bearer $token",
        //           },
        //         ),
        //         data: {
        //           'latitude': value.latitude,
        //           'longitude': value.longitude
        //         },
        //         onReceiveProgress: (res, r) {})
        //     .then((value) => logger.d(value))
        //     .catchError((err) => logger.e(err));
        logger.e("Reaches the end");
      });
    }
    return Future.value(true);
  });
}

void updateRequest(
    String token, String courier, double latitude, double longitude) async {
  var headers = {'Content-Type': 'application/json'};
  var request = Request(
      'POST',
      Uri.parse(
          'https://foodieback.herokuapp.com/courier/update-location/$courier'));
  request.body = json.encode({"latitude": latitude, "longitude": longitude});
  request.headers.addAll(headers);
  StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    logger.i(await response.stream.bytesToString());
  }
}
