import 'package:foodie_courier/models/courier_model.dart';
import 'package:foodie_courier/models/product_order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_model.g.dart';
part 'order_model.freezed.dart';

@freezed
class Order with _$Order {
  factory Order(
      {Courier? courier,
      @Default(0)
      @JsonKey(name: "order_id")
          int order_id,
      @Default("")
      @JsonKey(name: "order_date")
          String order_date,
      @Default(0.0)
      @JsonKey(name: "order_amount")
          double order_amount,
      @Default(0)
      @JsonKey(name: "quantity")
          int quantity,
      @Default(0)
      @JsonKey(name: "delivery_cost")
          double delivery_cost,
      @Default("")
      @JsonKey(name: "orderStatus")
          String orderStatus,
      @Default(0.0)
      @JsonKey(name: "latitude")
          double latitude,
      @Default(0.0)
      @JsonKey(name: 'longitude')
          double longitude,
      @Default([])
      @JsonKey(name: "productOrder")
          List<ProductOrder> productOrder}) = _Order;
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
