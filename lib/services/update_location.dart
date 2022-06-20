import 'package:foodie_courier/services/service_locator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:workmanager/workmanager.dart';

const fetchBackground = "fetchBackground";

void updateCourierLocation() {
  Workmanager().executeTask((taskName, inputData) async {
    logger.i("Backgound service was called");
    // await Geolocator.requestPermission();
    // Position userLocation = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.bestForNavigation);
    return Future.value(true);
  });
}
