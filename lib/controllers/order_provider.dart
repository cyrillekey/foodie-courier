import 'package:flutter/cupertino.dart';
import 'package:foodie_courier/models/order_model.dart';

class OrderProvider with ChangeNotifier {
  List<Order> my_orders = List.empty();
  List<Order> pending_orders = List.empty();
}
