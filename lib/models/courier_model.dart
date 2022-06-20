import 'package:freezed_annotation/freezed_annotation.dart';
part 'courier_model.g.dart';
part 'courier_model.freezed.dart';

@freezed
class Courier with _$Courier {
  factory Courier(
      {@Default(0)
      @JsonKey(name: "courier_id")
          int courier_id,
      @Default("")
      @JsonKey(name: "id_number")
          String id_number,
      @Default("")
      @JsonKey(name: "phone_number1")
          String phone_number1,
      @Default("")
      @JsonKey(name: "phone_number2")
          String phone_number2,
      @Default(0.0)
      @JsonKey(name: "currentLatitude")
          double currentLatitude,
      @Default(0.0)
      @JsonKey(name: "currentLongitude")
          double currentLongitude,
      @Default(0.0)
      @JsonKey(name: "account_balance")
          double account_balance,
      @Default(0.0)
      @JsonKey(name: "rating")
          double rating,
      @Default(true)
      @JsonKey(name: "onAssingment")
          bool onAssingmnet,
      @Default(true)
      @JsonKey(name: "currentStatus")
          bool currentStatus,
      @Default("")
      @JsonKey(name: "vehicle_registration")
          String vehicle_registration}) = _Courier;
  factory Courier.fromJson(Map<String, dynamic> json) =>
      _$CourierFromJson(json);
}
