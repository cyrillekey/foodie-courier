// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      customer_id: json['customer_id'] as int? ?? 0,
      user_mail: json['user_mail'] as String? ?? "",
      user_name: json['user_name'] as String? ?? "",
      user_phone: json['user_phone'] as String? ?? " ",
      accountType: json['accountType'] as String? ?? "CUSTOMER",
      dateJoined: json['dateJoined'] as String? ?? "",
      accountStatus: json['accountStatus'] as String? ?? "",
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'customer_id': instance.customer_id,
      'user_mail': instance.user_mail,
      'user_name': instance.user_name,
      'user_phone': instance.user_phone,
      'accountType': instance.accountType,
      'dateJoined': instance.dateJoined,
      'accountStatus': instance.accountStatus,
    };
