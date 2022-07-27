import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodie_courier/api_client/api_client.dart';
import 'package:foodie_courier/api_client/api_response.dart';
import 'package:foodie_courier/database/local_db_dao.dart';
import 'package:foodie_courier/models/courier_model.dart';
import 'package:foodie_courier/models/user_model.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final apiClient = locator<ApiClient>();
  final db = locator<LocalDaoDb>();
  bool isLoading = false;
  User? currentUser;
  Courier? courier;
  onInit() async {
    currentUser = await db.getUser();
    courier = await db.getCourier();
    notifyListeners();
  }

  logout() async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.remove("token");
    await _prefs.remove("courier");
    await db.logout();
    notifyListeners();
  }

  Future<ApiResponse> loginUser(String email, String password) async {
    final _prefs = await SharedPreferences.getInstance();
    ApiResponse response = await apiClient
        .post("login", data: {"user_mail": email, "user_password": password});
    if (response.isSuccess) {
      User user = User.fromJson(response.response['customer']);
      if (user.accountType == "COURIER") {
        String token = response.response['token'];
        await _prefs.setString("token", token);
        Courier courier =
            Courier.fromJson(response.response['customer']['courier']);
        db.saveUser(user);
        db.saveCourier(courier);
        currentUser = user;
        this.courier = courier;
        await _prefs.setString("courier", courier.courier_id.toString());
        return response;
      } else {
        return ApiResponse(false, "User is not a courier");
      }
    } else {
      return response;
    }
  }

  Future<bool> silentLogin() async {
    User? current = await db.getUser();
    if (current != null) {
      logger.v("Silent login performed");
      final _prefs = await SharedPreferences.getInstance();
      ApiResponse response = await apiClient.post("silentlogin", data: {
        "user_mail": current.user_mail,
        "user_password": current.password
      });
      if (response.isSuccess) {
        User user = User.fromJson(response.response['customer']);
        if (user.accountType == "COURIER") {
          String token = response.response['token'];
          await _prefs.setString("token", token);
          Courier courier =
              Courier.fromJson(response.response['customer']['courier']);
          db.saveUser(user);
          db.saveCourier(courier);
          await _prefs.setString("courier", courier.courier_id.toString());
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      logger.e("Current user is null");
      logger.e(currentUser);
      return false;
    }
  }

  Future<bool> changeCurrentStatus() async {
    final _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString("token");
    ApiResponse response = await apiClient.post(
        "courier/change-current-status/${courier!.courier_id}",
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    if (response.isSuccess) {
      Courier courier = Courier.fromJson(response.response);
      db.saveCourier(courier);
      this.courier = courier;
      notifyListeners();
    }
    return response.isSuccess;
  }

  Future<bool> updateProfile() async {
    return true;
  }
}
