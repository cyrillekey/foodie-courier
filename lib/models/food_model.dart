import 'package:freezed_annotation/freezed_annotation.dart';
part 'food_model.g.dart';
part 'food_model.freezed.dart';

@freezed
class Food with _$Food {
  factory Food({
    @Default(0) @JsonKey(name: "food_id") int food_id,
    @Default("") @JsonKey(name: "food_name") String food_name,
    @Default("") @JsonKey(name: "food_desc") String food_desc,
    @Default(" ") @JsonKey(name: "food_image") String food_image,
    @Default(0.0) @JsonKey(name: "food_price") double food_price,
    @Default(0) @JsonKey(name: "food_calories") int food_calories,
    @JsonKey(name: "ratings") @Default(0.0) double ratings,
  }) = _Food;
  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);
}
