import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:workmanager/workmanager.dart';

void updateLocationForeground() async {
  final prefs = await SharedPreferences.getInstance();
  String? courier = prefs.getString("courier");
  String? token = prefs.getString("token");
  logger.d(courier);
  logger.d(token);
  if (courier != null && token != null) {
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation)
        .then((value) {
      logger.i(value);

      Dio()
          .post(
            "https://foodieback.herokuapp.com/courier/update-location/$courier",
            options: Options(
              headers: {
                "Authorization": "Bearer $token",
              },
            ),
            data: {'latitude': value.latitude, 'longitude': value.longitude},
          )
          .then((value) => logger.d(value))
          .catchError((err) => logger.e(err));
      logger.e("Reaches the end");
    });
  }
}

Future<String> getAddressName(String latitude, String longitude) async {
  logger.i("Im called");
  Dio()
      .get(
          "https://nominatim.openstreetmap.org/reverse?lat=$latitude&lon=$longitude")
      .then((value) {
    logger.w(value.data);
  });
  return "";
}

@pragma('vm:entry-point')
void callBackDispathcer() {
  Workmanager().executeTask((updateLocation, inputData) async {
    final prefs = await SharedPreferences.getInstance();
    String? courier = prefs.getString("courier");
    String? token = prefs.getString("token");
    logger.d(courier);
    logger.d(token);
    if (token == null || courier == null) {
      return Future.error("Courier or token not setup");
    }
    return await updateLocationMethod();
  });
}

Future<bool> updateLocationMethod() async {
  final prefs = await SharedPreferences.getInstance();
  String? courier = prefs.getString("courier");
  String? token = prefs.getString("token");
  logger.d(courier);
  logger.d(token);
  if (token == null || courier == null) {
    return Future.error("Courier or token not setup");
  }

  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation);
  logger.d(position);
  try {
    http.Response response = await http.post(
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
    logger.d(response.statusCode);
    return true;
  } on DioError catch (err) {
    logger.e(err);
    return Future.error(err.response?.data['message']);
  } catch (err) {
    logger.e(err);
    return Future.error("Error occured");
  }
}
