import 'package:drift/drift.dart' show Insertable, Expression, Value;
import 'package:foodie_courier/database/local_db.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'courier_model.g.dart';
part 'courier_model.freezed.dart';

@freezed
class Courier with _$Courier implements Insertable<Courier> {
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
          bool onAssingment,
      @Default(true)
      @JsonKey(name: "currentStatus")
          bool currentStatus,
      @Default("")
      @JsonKey(name: "vehicle_registration")
          String vehicle_registration}) = _Courier;
  factory Courier.fromJson(Map<String, dynamic> json) =>
      _$CourierFromJson(json);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return CourierTableCompanion(
            courier_id: Value(courier_id),
            id_number: Value(id_number),
            phone_number1: Value(phone_number1),
            phone_number2: Value(phone_number2),
            currentLatitude: Value(currentLatitude),
            currentLongitude: Value(currentLongitude),
            account_balance: Value(account_balance),
            rating: Value(rating),
            onAssingment: Value(onAssingment),
            currentStatus: Value(currentStatus),
            vehicle_registration: Value(vehicle_registration))
        .toColumns(nullToAbsent);
  }
}
