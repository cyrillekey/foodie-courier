import 'dart:convert';

import 'package:background_fetch/background_fetch.dart';
import 'package:dio/dio.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:http/http.dart' as http;
import 'package:workmanager/workmanager.dart';

const fetchBackground = "fetchBackground";

void updateCourierLocation(HeadlessTask headlessTask) async {
  String taskId = headlessTask.taskId;
  bool isTimeout = headlessTask.timeout;
  if (isTimeout) {
    logger.e("Headless task timed-out");
    BackgroundFetch.finish(taskId);
  }
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
      // http.post(
      //     Uri.parse(
      //         "https://foodieback.herokuapp.com/courier/update-location/$courier"),
      //     headers: {
      //       "Authorization": "Bearer $token",
      //       'Content-Type': 'application/json'
      //     },
      //     body: jsonEncode({
      //       'latitude': value.latitude,
      //       'longitude': value.longitude,
      //     }));
      logger.e("Reaches the end");
    });
  }
  BackgroundFetch.finish(taskId);
}

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
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation)
        .then((value) {
      logger.i(value);
      try {
        Dio().post(
          "https://foodieback.herokuapp.com/courier/update-location/$courier",
          options: Options(
            headers: {
              "Authorization": "Bearer $token",
            },
          ),
          data: {'latitude': value.latitude, 'longitude': value.longitude},
        );
        return Future.value(true);
      } on DioError catch (err) {
        logger.e(err);
        return Future.error(err.response?.data['message']);
      } catch (err) {
        logger.e(err);
        return Future.error("Error occured");
      }
    });
  });
}
