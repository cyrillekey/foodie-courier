// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      order_id: json['order_id'] as int? ?? 0,
      order_date: json['order_date'] as String? ?? "",
      order_amount: (json['order_amount'] as num?)?.toDouble() ?? 0.0,
      quantity: json['quantity'] as int? ?? 0,
      delivery_cost: json['delivery_cost'] as int? ?? 0,
      orderStatus: json['orderStatus'] as String? ?? "",
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'order_id': instance.order_id,
      'order_date': instance.order_date,
      'order_amount': instance.order_amount,
      'quantity': instance.quantity,
      'delivery_cost': instance.delivery_cost,
      'orderStatus': instance.orderStatus,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
