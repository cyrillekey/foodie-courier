// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
// Courier? courier,
  @JsonKey(name: "order_id")
  int get order_id => throw _privateConstructorUsedError;
  @JsonKey(name: "order_date")
  String get order_date => throw _privateConstructorUsedError;
  @JsonKey(name: "order_amount")
  double get order_amount => throw _privateConstructorUsedError;
  @JsonKey(name: "quantity")
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: "delivery_cost")
  int get delivery_cost => throw _privateConstructorUsedError;
  @JsonKey(name: "orderStatus")
  String get orderStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "latitude")
  double get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude')
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "order_id") int order_id,
      @JsonKey(name: "order_date") String order_date,
      @JsonKey(name: "order_amount") double order_amount,
      @JsonKey(name: "quantity") int quantity,
      @JsonKey(name: "delivery_cost") int delivery_cost,
      @JsonKey(name: "orderStatus") String orderStatus,
      @JsonKey(name: "latitude") double latitude,
      @JsonKey(name: 'longitude') double longitude});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res> implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  final Order _value;
  // ignore: unused_field
  final $Res Function(Order) _then;

  @override
  $Res call({
    Object? order_id = freezed,
    Object? order_date = freezed,
    Object? order_amount = freezed,
    Object? quantity = freezed,
    Object? delivery_cost = freezed,
    Object? orderStatus = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      order_id: order_id == freezed
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as int,
      order_date: order_date == freezed
          ? _value.order_date
          : order_date // ignore: cast_nullable_to_non_nullable
              as String,
      order_amount: order_amount == freezed
          ? _value.order_amount
          : order_amount // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      delivery_cost: delivery_cost == freezed
          ? _value.delivery_cost
          : delivery_cost // ignore: cast_nullable_to_non_nullable
              as int,
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$_OrderCopyWith(_$_Order value, $Res Function(_$_Order) then) =
      __$$_OrderCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "order_id") int order_id,
      @JsonKey(name: "order_date") String order_date,
      @JsonKey(name: "order_amount") double order_amount,
      @JsonKey(name: "quantity") int quantity,
      @JsonKey(name: "delivery_cost") int delivery_cost,
      @JsonKey(name: "orderStatus") String orderStatus,
      @JsonKey(name: "latitude") double latitude,
      @JsonKey(name: 'longitude') double longitude});
}

/// @nodoc
class __$$_OrderCopyWithImpl<$Res> extends _$OrderCopyWithImpl<$Res>
    implements _$$_OrderCopyWith<$Res> {
  __$$_OrderCopyWithImpl(_$_Order _value, $Res Function(_$_Order) _then)
      : super(_value, (v) => _then(v as _$_Order));

  @override
  _$_Order get _value => super._value as _$_Order;

  @override
  $Res call({
    Object? order_id = freezed,
    Object? order_date = freezed,
    Object? order_amount = freezed,
    Object? quantity = freezed,
    Object? delivery_cost = freezed,
    Object? orderStatus = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$_Order(
      order_id: order_id == freezed
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as int,
      order_date: order_date == freezed
          ? _value.order_date
          : order_date // ignore: cast_nullable_to_non_nullable
              as String,
      order_amount: order_amount == freezed
          ? _value.order_amount
          : order_amount // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      delivery_cost: delivery_cost == freezed
          ? _value.delivery_cost
          : delivery_cost // ignore: cast_nullable_to_non_nullable
              as int,
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Order implements _Order {
  _$_Order(
      {@JsonKey(name: "order_id") this.order_id = 0,
      @JsonKey(name: "order_date") this.order_date = "",
      @JsonKey(name: "order_amount") this.order_amount = 0.0,
      @JsonKey(name: "quantity") this.quantity = 0,
      @JsonKey(name: "delivery_cost") this.delivery_cost = 0,
      @JsonKey(name: "orderStatus") this.orderStatus = "",
      @JsonKey(name: "latitude") this.latitude = 0.0,
      @JsonKey(name: 'longitude') this.longitude = 0.0});

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$$_OrderFromJson(json);

// Courier? courier,
  @override
  @JsonKey(name: "order_id")
  final int order_id;
  @override
  @JsonKey(name: "order_date")
  final String order_date;
  @override
  @JsonKey(name: "order_amount")
  final double order_amount;
  @override
  @JsonKey(name: "quantity")
  final int quantity;
  @override
  @JsonKey(name: "delivery_cost")
  final int delivery_cost;
  @override
  @JsonKey(name: "orderStatus")
  final String orderStatus;
  @override
  @JsonKey(name: "latitude")
  final double latitude;
  @override
  @JsonKey(name: 'longitude')
  final double longitude;

  @override
  String toString() {
    return 'Order(order_id: $order_id, order_date: $order_date, order_amount: $order_amount, quantity: $quantity, delivery_cost: $delivery_cost, orderStatus: $orderStatus, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Order &&
            const DeepCollectionEquality().equals(other.order_id, order_id) &&
            const DeepCollectionEquality()
                .equals(other.order_date, order_date) &&
            const DeepCollectionEquality()
                .equals(other.order_amount, order_amount) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality()
                .equals(other.delivery_cost, delivery_cost) &&
            const DeepCollectionEquality()
                .equals(other.orderStatus, orderStatus) &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(order_id),
      const DeepCollectionEquality().hash(order_date),
      const DeepCollectionEquality().hash(order_amount),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(delivery_cost),
      const DeepCollectionEquality().hash(orderStatus),
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude));

  @JsonKey(ignore: true)
  @override
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      __$$_OrderCopyWithImpl<_$_Order>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderToJson(this);
  }
}

abstract class _Order implements Order {
  factory _Order(
      {@JsonKey(name: "order_id") final int order_id,
      @JsonKey(name: "order_date") final String order_date,
      @JsonKey(name: "order_amount") final double order_amount,
      @JsonKey(name: "quantity") final int quantity,
      @JsonKey(name: "delivery_cost") final int delivery_cost,
      @JsonKey(name: "orderStatus") final String orderStatus,
      @JsonKey(name: "latitude") final double latitude,
      @JsonKey(name: 'longitude') final double longitude}) = _$_Order;

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override // Courier? courier,
  @JsonKey(name: "order_id")
  int get order_id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "order_date")
  String get order_date => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "order_amount")
  double get order_amount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "quantity")
  int get quantity => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "delivery_cost")
  int get delivery_cost => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "orderStatus")
  String get orderStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "latitude")
  double get latitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'longitude')
  double get longitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      throw _privateConstructorUsedError;
}
