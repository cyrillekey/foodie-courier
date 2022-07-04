import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodie_courier/api_client/api_client.dart';
import 'package:foodie_courier/api_client/api_response.dart';
import 'package:foodie_courier/database/local_db_dao.dart';
import 'package:foodie_courier/models/courier_model.dart';
import 'package:foodie_courier/models/order_model.dart';
import 'package:foodie_courier/models/user_model.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderProvider with ChangeNotifier {
  List<Order> my_orders = [];
  List<Order> pending_orders = [];
  User? user;
  Courier? courier;
  String? token;
  final apiClient = locator<ApiClient>();
  final db = locator<LocalDaoDb>();

  init() async {
    var _prefs = await SharedPreferences.getInstance();
    user = await db.getUser();
    courier = await db.getCourier();
    token = _prefs.getString("token");
    fetchOrders(token!, courier!.courier_id);
  }

  Future<void> fetchOrders(String token, int courier_id) async {
    ApiResponse response = await apiClient.post(
        "courier/get-past-orders/$courier_id",
        options: Options(headers: {"Authorization": "Bearer $token"}));
    if (response.isSuccess) {
      if (!response.response.isEmpty) {
        my_orders = response.response.forEach((json) => Order.fromJson(json));
      }
    }
  }

  Future<bool> acceptOrder(String order_id) async {
    ApiResponse response = await apiClient.post(
        'courier/assign-courier/${order_id}/${courier!.courier_id}',
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    return response.isSuccess;
  }

  Future<void> rejectOrder(String order_id) async {}
  Future<void> getSingleOrder(String order_id) async {}
  Future<void> deliverOrder(String order_id, String authentication) async {}
}
