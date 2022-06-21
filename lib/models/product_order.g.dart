// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductOrder _$$_ProductOrderFromJson(Map<String, dynamic> json) =>
    _$_ProductOrder(
      product_order_id: json['product_order_id'] as String? ?? 0,
      quantity: json['qunatity'] as int? ?? 0,
      food: json['food'] == null
          ? null
          : Food.fromJson(json['food'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProductOrderToJson(_$_ProductOrder instance) =>
    <String, dynamic>{
      'product_order_id': instance.product_order_id,
      'qunatity': instance.quantity,
      'food': instance.food,
    };
