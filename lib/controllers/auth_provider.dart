import 'package:flutter/cupertino.dart';
import 'package:foodie_courier/api_client/api_client.dart';
import 'package:foodie_courier/api_client/api_response.dart';
import 'package:foodie_courier/database/local_db_dao.dart';
import 'package:foodie_courier/models/courier_model.dart';
import 'package:foodie_courier/models/user_model.dart';
import 'package:foodie_courier/services/service_locator.dart';

class AuthProvider with ChangeNotifier {
  final apiClient = locator<ApiClient>();
  final db = locator<LocalDaoDb>();
  bool isLoading = false;
  User? currentUser;
  onInit() async {
    currentUser = await db.getUser();
    logger.i(currentUser);
  }

  Future<bool> loginUser(String email, String password) async {
    ApiResponse response = await apiClient
        .post("login", data: {"user_mail": email, "user_password": password});
    if (response.isSuccess) {
      User user = User.fromJson(response.response['customer']);
      if (user.accountType == "COURIER") {
        String token = response.response['token'];
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
