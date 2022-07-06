import 'package:flutter/widgets.dart';
import 'package:foodie_courier/models/order_model.dart';

class ParcelCenterProvider with ChangeNotifier {
  List<Order> awaiting_drivers = [];
}
