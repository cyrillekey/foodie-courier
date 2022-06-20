import 'package:foodie_courier/models/food_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_order.g.dart';
part 'product_order.freezed.dart';

@freezed
class ProductOrder with _$ProductOrder {
  factory ProductOrder(
      {@Default(0) @JsonKey(name: "product_order_id") String product_order_id,
      @Default(0) @JsonKey(name: "qunatity") int quantity,
      Food? food}) = _ProductOrder;
  factory ProductOrder.fromJson(Map<String, dynamic> json) =>
      _$ProductOrderFromJson(json);
}
