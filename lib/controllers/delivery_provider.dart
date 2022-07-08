import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodie_courier/api_client/api_client.dart';
import 'package:foodie_courier/api_client/api_response.dart';
import 'package:foodie_courier/controllers/auth_provider.dart';
import 'package:foodie_courier/models/courier_model.dart';
import 'package:foodie_courier/models/order_model.dart';
import 'package:foodie_courier/models/user_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/service_locator.dart';

class DeliveryProvider with ChangeNotifier {
  final apiClient = locator<ApiClient>();
  Position? position;
  Order? order;
  User? user;
  Courier? courier;
  String? token;
  bool isLoading = false;
  void init(String id) async {
    isLoading = true;
    notifyListeners();
    var prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    courier = AuthProvider().courier;
    await initOrderDeliveryDirections();
    await getOrderForDelivery(id);
    await getOrderCustomer(id);
    isLoading = false;
    notifyListeners();
  }

  Future<void> initOrderDeliveryDirections() async {
    await Geolocator.requestPermission();
    LocationPermission allowed = await Geolocator.checkPermission();
    if (allowed == LocationPermission.deniedForever ||
        allowed == LocationPermission.denied) {
      initOrderDeliveryDirections();
    } else {
      Position userLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
      position = userLocation;
    }
  }

  Future<bool> getOrderForDelivery(String id) async {
    ApiResponse response = await apiClient.get('courier/get-order-details/$id',
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    if (response.isSuccess) {
      order = Order.fromJson(response.response);
      return true;
    }
    return false;
  }

  Future<bool> getOrderCustomer(String id) async {
    ApiResponse response = await apiClient.post('courier/order-customer/$id',
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    if (response.isSuccess) {
      user = User.fromJson(response.response);
      return true;
    }
    return false;
  }
}
