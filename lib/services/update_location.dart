import 'package:dio/dio.dart';
import 'package:foodie_courier/api_client/api_client.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

const fetchBackground = "fetchBackground";

void updateCourierLocation() {
  final apiClient = locator<ApiClient>();
  Workmanager().executeTask((taskName, inputData) async {
    logger.i("Backgound service was called");
    final prefs = await SharedPreferences.getInstance();
    String? courier = prefs.getString("courier");
    String? token = prefs.getString("token");
    if (courier != null) {
      await Geolocator.requestPermission();
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.bestForNavigation)
          .then((value) {
        apiClient.post("courier/update-location/$courier",
            options: Options(headers: {"Authorization": "Bearer $token"}),
            data: {'latitude': value.latitude, 'longitude': value.longitude});
      });
    }
    return Future.value(true);
  });
}
