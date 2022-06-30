import 'package:dio/dio.dart';
import 'package:foodie_courier/api_client/api_client.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

const fetchBackground = "fetchBackground";

void updateCourierLocation() {
  Workmanager().executeTask((taskName, inputData) async {
    final prefs = await SharedPreferences.getInstance();
    String? courier = prefs.getString("courier");
    String? token = prefs.getString("token");
    if (courier != null) {
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
                    'Content-Type': 'application/json'
                  },
                ),
                data: {
                  'latitude': value.latitude,
                  'longitude': value.longitude
                },
                onReceiveProgress: (res, r) {})
            .then((value) => logger.d(value))
            .catchError((err) => logger.e(err));
        logger.e("Reaches the end");
      });
    }
    return Future.value(true);
  });
}
