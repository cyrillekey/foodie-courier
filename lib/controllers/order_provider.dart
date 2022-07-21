import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodie_courier/api_client/api_client.dart';
import 'package:foodie_courier/api_client/api_response.dart';
import 'package:foodie_courier/database/local_db_dao.dart';
import 'package:foodie_courier/models/courier_model.dart';
import 'package:foodie_courier/models/order_model.dart';
import 'package:foodie_courier/models/user_model.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderProvider with ChangeNotifier {
  List<Order> my_orders = [];
  List<Order> pending_orders = [];
  List<Order> allorders = [];
  User? user;
  Courier? courier;
  String? token;
  Position? position;
  Order? current_order;
  User? _customer;
  bool isLoading = false;
  final apiClient = locator<ApiClient>();
  final db = locator<LocalDaoDb>();

  init() async {
    var _prefs = await SharedPreferences.getInstance();
    user = await db.getUser();
    courier = await db.getCourier();
    token = _prefs.getString("token");
    fetchOrders(token!, courier!.courier_id);
    fetchPendingOrders(token!, courier!.courier_id);
  }

  Future<void> fetchOrders(String token, int courier_id) async {
    isLoading = true;
    notifyListeners();
    my_orders.clear();
    ApiResponse response = await apiClient.post(
        "courier/get-past-orders/$courier_id",
        options: Options(headers: {"Authorization": "Bearer $token"}));
    if (response.isSuccess) {
      if (!response.response.isEmpty) {
        response.response
            .forEach((json) => my_orders.add(Order.fromJson(json)));
      }
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchPendingOrders(String token, int courier_id) async {
    isLoading = true;
    notifyListeners();
    pending_orders.clear();
    ApiResponse response = await apiClient.get(
        "courier/get-pending-orders/$courier_id",
        options: Options(headers: {"Authorization": "Bearer $token"}));
    if (response.isSuccess) {
      if (!response.response.isEmpty) {
        response.response
            .forEach((json) => pending_orders.add(Order.fromJson(json)));
      }
    }
    isLoading = false;
    notifyListeners();
  }

  Future<ApiResponse> acceptOrder(String order_id) async {
    try {
      ApiResponse response = await apiClient.get(
          'courier/assign-courier/$order_id/${courier!.courier_id}',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      logger.e(response.message);
      return response;
    } catch (e) {
      return ApiResponse(false, e.toString());
    }
  }

  Future<void> rejectOrder(String order_id) async {}
  Future<void> getSingleOrder(String order_id) async {
    isLoading = true;
    notifyListeners();
    ApiResponse response = await apiClient.get(
        "courier/get-order-details/$order_id",
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    if (response.isSuccess) {
      Order order = Order.fromJson(response.response);
      current_order = order;
      isLoading = false;
      notifyListeners();
    }
  }

  Future<ApiResponse> deliverOrder(String otp) async {
    isLoading = true;
    notifyListeners();
    ApiResponse response = await apiClient.post("courier/deliver-order",
        options: Options(headers: {'Authorization': 'Bearer $token'}),
        data: {"otp": otp});
    return response;
  }

  Future<void> getCustomerByOrder() async {
    ApiResponse response = await apiClient.post(
        "courier/order-customer/${current_order?.order_id}",
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    if (response.isSuccess) {
      _customer = User.fromJson(response.response);
    }
  }
}
