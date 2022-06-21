// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courier_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Courier _$$_CourierFromJson(Map<String, dynamic> json) => _$_Courier(
      courier_id: json['courier_id'] as int? ?? 0,
      id_number: json['id_number'] as String? ?? "",
      phone_number1: json['phone_number1'] as String? ?? "",
      phone_number2: json['phone_number2'] as String? ?? "",
      currentLatitude: (json['currentLatitude'] as num?)?.toDouble() ?? 0.0,
      currentLongitude: (json['currentLongitude'] as num?)?.toDouble() ?? 0.0,
      account_balance: (json['account_balance'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      onAssingment: json['onAssingment'] as bool? ?? true,
      currentStatus: json['currentStatus'] as bool? ?? true,
      vehicle_registration: json['vehicle_registration'] as String? ?? "",
    );

Map<String, dynamic> _$$_CourierToJson(_$_Courier instance) =>
    <String, dynamic>{
      'courier_id': instance.courier_id,
      'id_number': instance.id_number,
      'phone_number1': instance.phone_number1,
      'phone_number2': instance.phone_number2,
      'currentLatitude': instance.currentLatitude,
      'currentLongitude': instance.currentLongitude,
      'account_balance': instance.account_balance,
      'rating': instance.rating,
      'onAssingment': instance.onAssingment,
      'currentStatus': instance.currentStatus,
      'vehicle_registration': instance.vehicle_registration,
    };
