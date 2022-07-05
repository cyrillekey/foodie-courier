import 'package:background_fetch/background_fetch.dart';
import 'package:dio/dio.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

const fetchBackground = "fetchBackground";

void updateCourierLocation(HeadlessTask headlessTask) async {
  String taskId = headlessTask.taskId;
  bool isTimeout = headlessTask.timeout;
  if (isTimeout) {
    logger.e("Headless task timed-out");
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
      updateRequest(token, courier, value.latitude, value.longitude);
      Dio()
          .post(
              "https://foodieback.herokuapp.com/courier/update-location/$courier",
              options: Options(
                headers: {
                  "Authorization": "Bearer $token",
                },
              ),
              data: {'latitude': value.latitude, 'longitude': value.longitude},
              onReceiveProgress: (res, r) {})
          .then((value) => logger.d(value))
          .catchError((err) => logger.e(err));
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
      updateRequest(token, courier, value.latitude, value.longitude);
      Dio()
          .post(
              "https://foodieback.herokuapp.com/courier/update-location/$courier",
              options: Options(
                headers: {
                  "Authorization": "Bearer $token",
                },
              ),
              data: {'latitude': value.latitude, 'longitude': value.longitude},
              onReceiveProgress: (res, r) {})
          .then((value) => logger.d(value))
          .catchError((err) => logger.e(err));
      logger.e("Reaches the end");
    });
  }
}

void updateRequest(
    String token, String courier, double latitude, double longitude) async {}
