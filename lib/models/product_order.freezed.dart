// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductOrder _$ProductOrderFromJson(Map<String, dynamic> json) {
  return _ProductOrder.fromJson(json);
}

/// @nodoc
mixin _$ProductOrder {
  @JsonKey(name: "product_order_id")
  String get product_order_id => throw _privateConstructorUsedError;
  @JsonKey(name: "qunatity")
  int get quantity => throw _privateConstructorUsedError;
  Food? get food => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductOrderCopyWith<ProductOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductOrderCopyWith<$Res> {
  factory $ProductOrderCopyWith(
          ProductOrder value, $Res Function(ProductOrder) then) =
      _$ProductOrderCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "product_order_id") String product_order_id,
      @JsonKey(name: "qunatity") int quantity,
      Food? food});

  $FoodCopyWith<$Res>? get food;
}

/// @nodoc
class _$ProductOrderCopyWithImpl<$Res> implements $ProductOrderCopyWith<$Res> {
  _$ProductOrderCopyWithImpl(this._value, this._then);

  final ProductOrder _value;
  // ignore: unused_field
  final $Res Function(ProductOrder) _then;

  @override
  $Res call({
    Object? product_order_id = freezed,
    Object? quantity = freezed,
    Object? food = freezed,
  }) {
    return _then(_value.copyWith(
      product_order_id: product_order_id == freezed
          ? _value.product_order_id
          : product_order_id // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      food: food == freezed
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Food?,
    ));
  }

  @override
  $FoodCopyWith<$Res>? get food {
    if (_value.food == null) {
      return null;
    }

    return $FoodCopyWith<$Res>(_value.food!, (value) {
      return _then(_value.copyWith(food: value));
    });
  }
}

/// @nodoc
abstract class _$$_ProductOrderCopyWith<$Res>
    implements $ProductOrderCopyWith<$Res> {
  factory _$$_ProductOrderCopyWith(
          _$_ProductOrder value, $Res Function(_$_ProductOrder) then) =
      __$$_ProductOrderCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "product_order_id") String product_order_id,
      @JsonKey(name: "qunatity") int quantity,
      Food? food});

  @override
  $FoodCopyWith<$Res>? get food;
}

/// @nodoc
class __$$_ProductOrderCopyWithImpl<$Res>
    extends _$ProductOrderCopyWithImpl<$Res>
    implements _$$_ProductOrderCopyWith<$Res> {
  __$$_ProductOrderCopyWithImpl(
      _$_ProductOrder _value, $Res Function(_$_ProductOrder) _then)
      : super(_value, (v) => _then(v as _$_ProductOrder));

  @override
  _$_ProductOrder get _value => super._value as _$_ProductOrder;

  @override
  $Res call({
    Object? product_order_id = freezed,
    Object? quantity = freezed,
    Object? food = freezed,
  }) {
    return _then(_$_ProductOrder(
      product_order_id: product_order_id == freezed
          ? _value.product_order_id
          : product_order_id // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      food: food == freezed
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Food?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductOrder implements _ProductOrder {
  _$_ProductOrder(
      {@JsonKey(name: "product_order_id") this.product_order_id = 0,
      @JsonKey(name: "qunatity") this.quantity = 0,
      this.food});

  factory _$_ProductOrder.fromJson(Map<String, dynamic> json) =>
      _$$_ProductOrderFromJson(json);

  @override
  @JsonKey(name: "product_order_id")
  final String product_order_id;
  @override
  @JsonKey(name: "qunatity")
  final int quantity;
  @override
  final Food? food;

  @override
  String toString() {
    return 'ProductOrder(product_order_id: $product_order_id, quantity: $quantity, food: $food)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductOrder &&
            const DeepCollectionEquality()
                .equals(other.product_order_id, product_order_id) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.food, food));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(product_order_id),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(food));

  @JsonKey(ignore: true)
  @override
  _$$_ProductOrderCopyWith<_$_ProductOrder> get copyWith =>
      __$$_ProductOrderCopyWithImpl<_$_ProductOrder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductOrderToJson(this);
  }
}

abstract class _ProductOrder implements ProductOrder {
  factory _ProductOrder(
      {@JsonKey(name: "product_order_id") final String product_order_id,
      @JsonKey(name: "qunatity") final int quantity,
      final Food? food}) = _$_ProductOrder;

  factory _ProductOrder.fromJson(Map<String, dynamic> json) =
      _$_ProductOrder.fromJson;

  @override
  @JsonKey(name: "product_order_id")
  String get product_order_id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "qunatity")
  int get quantity => throw _privateConstructorUsedError;
  @override
  Food? get food => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProductOrderCopyWith<_$_ProductOrder> get copyWith =>
      throw _privateConstructorUsedError;
}
