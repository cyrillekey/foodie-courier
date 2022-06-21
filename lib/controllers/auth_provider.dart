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

  onInit() async {
    currentUser = await db.getUser();
    notifyListeners();
  }

  logout() async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.remove("token");
    await db.logout();
    notifyListeners();
  }

  Future<bool> loginUser(String email, String password) async {
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
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
