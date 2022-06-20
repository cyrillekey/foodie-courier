// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'courier_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Courier _$CourierFromJson(Map<String, dynamic> json) {
  return _Courier.fromJson(json);
}

/// @nodoc
mixin _$Courier {
  @JsonKey(name: "courier_id")
  int get courier_id => throw _privateConstructorUsedError;
  @JsonKey(name: "id_number")
  String get id_number => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number1")
  String get phone_number1 => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number2")
  String get phone_number2 => throw _privateConstructorUsedError;
  @JsonKey(name: "currentLatitude")
  double get currentLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: "currentLongitude")
  double get currentLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: "account_balance")
  double get account_balance => throw _privateConstructorUsedError;
  @JsonKey(name: "rating")
  double get rating => throw _privateConstructorUsedError;
  @JsonKey(name: "onAssingment")
  bool get onAssingmnet => throw _privateConstructorUsedError;
  @JsonKey(name: "currentStatus")
  bool get currentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "vehicle_registration")
  String get vehicle_registration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourierCopyWith<Courier> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourierCopyWith<$Res> {
  factory $CourierCopyWith(Courier value, $Res Function(Courier) then) =
      _$CourierCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "courier_id") int courier_id,
      @JsonKey(name: "id_number") String id_number,
      @JsonKey(name: "phone_number1") String phone_number1,
      @JsonKey(name: "phone_number2") String phone_number2,
      @JsonKey(name: "currentLatitude") double currentLatitude,
      @JsonKey(name: "currentLongitude") double currentLongitude,
      @JsonKey(name: "account_balance") double account_balance,
      @JsonKey(name: "rating") double rating,
      @JsonKey(name: "onAssingment") bool onAssingmnet,
      @JsonKey(name: "currentStatus") bool currentStatus,
      @JsonKey(name: "vehicle_registration") String vehicle_registration});
}

/// @nodoc
class _$CourierCopyWithImpl<$Res> implements $CourierCopyWith<$Res> {
  _$CourierCopyWithImpl(this._value, this._then);

  final Courier _value;
  // ignore: unused_field
  final $Res Function(Courier) _then;

  @override
  $Res call({
    Object? courier_id = freezed,
    Object? id_number = freezed,
    Object? phone_number1 = freezed,
    Object? phone_number2 = freezed,
    Object? currentLatitude = freezed,
    Object? currentLongitude = freezed,
    Object? account_balance = freezed,
    Object? rating = freezed,
    Object? onAssingmnet = freezed,
    Object? currentStatus = freezed,
    Object? vehicle_registration = freezed,
  }) {
    return _then(_value.copyWith(
      courier_id: courier_id == freezed
          ? _value.courier_id
          : courier_id // ignore: cast_nullable_to_non_nullable
              as int,
      id_number: id_number == freezed
          ? _value.id_number
          : id_number // ignore: cast_nullable_to_non_nullable
              as String,
      phone_number1: phone_number1 == freezed
          ? _value.phone_number1
          : phone_number1 // ignore: cast_nullable_to_non_nullable
              as String,
      phone_number2: phone_number2 == freezed
          ? _value.phone_number2
          : phone_number2 // ignore: cast_nullable_to_non_nullable
              as String,
      currentLatitude: currentLatitude == freezed
          ? _value.currentLatitude
          : currentLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      currentLongitude: currentLongitude == freezed
          ? _value.currentLongitude
          : currentLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      account_balance: account_balance == freezed
          ? _value.account_balance
          : account_balance // ignore: cast_nullable_to_non_nullable
              as double,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      onAssingmnet: onAssingmnet == freezed
          ? _value.onAssingmnet
          : onAssingmnet // ignore: cast_nullable_to_non_nullable
              as bool,
      currentStatus: currentStatus == freezed
          ? _value.currentStatus
          : currentStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      vehicle_registration: vehicle_registration == freezed
          ? _value.vehicle_registration
          : vehicle_registration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CourierCopyWith<$Res> implements $CourierCopyWith<$Res> {
  factory _$$_CourierCopyWith(
          _$_Courier value, $Res Function(_$_Courier) then) =
      __$$_CourierCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "courier_id") int courier_id,
      @JsonKey(name: "id_number") String id_number,
      @JsonKey(name: "phone_number1") String phone_number1,
      @JsonKey(name: "phone_number2") String phone_number2,
      @JsonKey(name: "currentLatitude") double currentLatitude,
      @JsonKey(name: "currentLongitude") double currentLongitude,
      @JsonKey(name: "account_balance") double account_balance,
      @JsonKey(name: "rating") double rating,
      @JsonKey(name: "onAssingment") bool onAssingmnet,
      @JsonKey(name: "currentStatus") bool currentStatus,
      @JsonKey(name: "vehicle_registration") String vehicle_registration});
}

/// @nodoc
class __$$_CourierCopyWithImpl<$Res> extends _$CourierCopyWithImpl<$Res>
    implements _$$_CourierCopyWith<$Res> {
  __$$_CourierCopyWithImpl(_$_Courier _value, $Res Function(_$_Courier) _then)
      : super(_value, (v) => _then(v as _$_Courier));

  @override
  _$_Courier get _value => super._value as _$_Courier;

  @override
  $Res call({
    Object? courier_id = freezed,
    Object? id_number = freezed,
    Object? phone_number1 = freezed,
    Object? phone_number2 = freezed,
    Object? currentLatitude = freezed,
    Object? currentLongitude = freezed,
    Object? account_balance = freezed,
    Object? rating = freezed,
    Object? onAssingmnet = freezed,
    Object? currentStatus = freezed,
    Object? vehicle_registration = freezed,
  }) {
    return _then(_$_Courier(
      courier_id: courier_id == freezed
          ? _value.courier_id
          : courier_id // ignore: cast_nullable_to_non_nullable
              as int,
      id_number: id_number == freezed
          ? _value.id_number
          : id_number // ignore: cast_nullable_to_non_nullable
              as String,
      phone_number1: phone_number1 == freezed
          ? _value.phone_number1
          : phone_number1 // ignore: cast_nullable_to_non_nullable
              as String,
      phone_number2: phone_number2 == freezed
          ? _value.phone_number2
          : phone_number2 // ignore: cast_nullable_to_non_nullable
              as String,
      currentLatitude: currentLatitude == freezed
          ? _value.currentLatitude
          : currentLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      currentLongitude: currentLongitude == freezed
          ? _value.currentLongitude
          : currentLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      account_balance: account_balance == freezed
          ? _value.account_balance
          : account_balance // ignore: cast_nullable_to_non_nullable
              as double,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      onAssingmnet: onAssingmnet == freezed
          ? _value.onAssingmnet
          : onAssingmnet // ignore: cast_nullable_to_non_nullable
              as bool,
      currentStatus: currentStatus == freezed
          ? _value.currentStatus
          : currentStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      vehicle_registration: vehicle_registration == freezed
          ? _value.vehicle_registration
          : vehicle_registration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Courier implements _Courier {
  _$_Courier(
      {@JsonKey(name: "courier_id") this.courier_id = 0,
      @JsonKey(name: "id_number") this.id_number = "",
      @JsonKey(name: "phone_number1") this.phone_number1 = "",
      @JsonKey(name: "phone_number2") this.phone_number2 = "",
      @JsonKey(name: "currentLatitude") this.currentLatitude = 0.0,
      @JsonKey(name: "currentLongitude") this.currentLongitude = 0.0,
      @JsonKey(name: "account_balance") this.account_balance = 0.0,
      @JsonKey(name: "rating") this.rating = 0.0,
      @JsonKey(name: "onAssingment") this.onAssingmnet = true,
      @JsonKey(name: "currentStatus") this.currentStatus = true,
      @JsonKey(name: "vehicle_registration") this.vehicle_registration = ""});

  factory _$_Courier.fromJson(Map<String, dynamic> json) =>
      _$$_CourierFromJson(json);

  @override
  @JsonKey(name: "courier_id")
  final int courier_id;
  @override
  @JsonKey(name: "id_number")
  final String id_number;
  @override
  @JsonKey(name: "phone_number1")
  final String phone_number1;
  @override
  @JsonKey(name: "phone_number2")
  final String phone_number2;
  @override
  @JsonKey(name: "currentLatitude")
  final double currentLatitude;
  @override
  @JsonKey(name: "currentLongitude")
  final double currentLongitude;
  @override
  @JsonKey(name: "account_balance")
  final double account_balance;
  @override
  @JsonKey(name: "rating")
  final double rating;
  @override
  @JsonKey(name: "onAssingment")
  final bool onAssingmnet;
  @override
  @JsonKey(name: "currentStatus")
  final bool currentStatus;
  @override
  @JsonKey(name: "vehicle_registration")
  final String vehicle_registration;

  @override
  String toString() {
    return 'Courier(courier_id: $courier_id, id_number: $id_number, phone_number1: $phone_number1, phone_number2: $phone_number2, currentLatitude: $currentLatitude, currentLongitude: $currentLongitude, account_balance: $account_balance, rating: $rating, onAssingmnet: $onAssingmnet, currentStatus: $currentStatus, vehicle_registration: $vehicle_registration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Courier &&
            const DeepCollectionEquality()
                .equals(other.courier_id, courier_id) &&
            const DeepCollectionEquality().equals(other.id_number, id_number) &&
            const DeepCollectionEquality()
                .equals(other.phone_number1, phone_number1) &&
            const DeepCollectionEquality()
                .equals(other.phone_number2, phone_number2) &&
            const DeepCollectionEquality()
                .equals(other.currentLatitude, currentLatitude) &&
            const DeepCollectionEquality()
                .equals(other.currentLongitude, currentLongitude) &&
            const DeepCollectionEquality()
                .equals(other.account_balance, account_balance) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality()
                .equals(other.onAssingmnet, onAssingmnet) &&
            const DeepCollectionEquality()
                .equals(other.currentStatus, currentStatus) &&
            const DeepCollectionEquality()
                .equals(other.vehicle_registration, vehicle_registration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(courier_id),
      const DeepCollectionEquality().hash(id_number),
      const DeepCollectionEquality().hash(phone_number1),
      const DeepCollectionEquality().hash(phone_number2),
      const DeepCollectionEquality().hash(currentLatitude),
      const DeepCollectionEquality().hash(currentLongitude),
      const DeepCollectionEquality().hash(account_balance),
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(onAssingmnet),
      const DeepCollectionEquality().hash(currentStatus),
      const DeepCollectionEquality().hash(vehicle_registration));

  @JsonKey(ignore: true)
  @override
  _$$_CourierCopyWith<_$_Courier> get copyWith =>
      __$$_CourierCopyWithImpl<_$_Courier>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourierToJson(this);
  }
}

abstract class _Courier implements Courier {
  factory _Courier(
      {@JsonKey(name: "courier_id")
          final int courier_id,
      @JsonKey(name: "id_number")
          final String id_number,
      @JsonKey(name: "phone_number1")
          final String phone_number1,
      @JsonKey(name: "phone_number2")
          final String phone_number2,
      @JsonKey(name: "currentLatitude")
          final double currentLatitude,
      @JsonKey(name: "currentLongitude")
          final double currentLongitude,
      @JsonKey(name: "account_balance")
          final double account_balance,
      @JsonKey(name: "rating")
          final double rating,
      @JsonKey(name: "onAssingment")
          final bool onAssingmnet,
      @JsonKey(name: "currentStatus")
          final bool currentStatus,
      @JsonKey(name: "vehicle_registration")
          final String vehicle_registration}) = _$_Courier;

  factory _Courier.fromJson(Map<String, dynamic> json) = _$_Courier.fromJson;

  @override
  @JsonKey(name: "courier_id")
  int get courier_id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "id_number")
  String get id_number => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "phone_number1")
  String get phone_number1 => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "phone_number2")
  String get phone_number2 => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "currentLatitude")
  double get currentLatitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "currentLongitude")
  double get currentLongitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "account_balance")
  double get account_balance => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "rating")
  double get rating => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "onAssingment")
  bool get onAssingmnet => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "currentStatus")
  bool get currentStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "vehicle_registration")
  String get vehicle_registration => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CourierCopyWith<_$_Courier> get copyWith =>
      throw _privateConstructorUsedError;
}
