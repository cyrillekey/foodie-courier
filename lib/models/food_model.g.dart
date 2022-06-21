// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Food _$$_FoodFromJson(Map<String, dynamic> json) => _$_Food(
      food_id: json['food_id'] as int? ?? 0,
      food_name: json['food_name'] as String? ?? "",
      food_desc: json['food_desc'] as String? ?? "",
      food_image: json['food_image'] as String? ?? " ",
      food_price: (json['food_price'] as num?)?.toDouble() ?? 0.0,
      food_calories: json['food_calories'] as int? ?? 0,
      ratings: (json['ratings'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$_FoodToJson(_$_Food instance) => <String, dynamic>{
      'food_id': instance.food_id,
      'food_name': instance.food_name,
      'food_desc': instance.food_desc,
      'food_image': instance.food_image,
      'food_price': instance.food_price,
      'food_calories': instance.food_calories,
      'ratings': instance.ratings,
    };
