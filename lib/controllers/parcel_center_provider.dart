import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:foodie_courier/api_client/api_response.dart';
import 'package:foodie_courier/models/order_model.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_client/api_client.dart';

class ParcelCenterProvider with ChangeNotifier {
  final _apiClinet = locator<ApiClient>();
  List<Order> awaiting_drivers = [];
  bool isLoading = false;
  Future<void> getOrdersWithoutCouriers() async {
    awaiting_drivers.clear();
    var _prefs = await SharedPreferences.getInstance();
    String token = _prefs.getString("token")!;
    isLoading = true;
    notifyListeners();
    ApiResponse response = await _apiClinet.get("courier/get-pending-orders",
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    if (response.isSuccess) {
      response.response.forEach((json) {
        awaiting_drivers.add(Order.fromJson(json));
      });
    }
    isLoading = false;
    notifyListeners();
  }
}
