// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'food_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Food _$FoodFromJson(Map<String, dynamic> json) {
  return _Food.fromJson(json);
}

/// @nodoc
mixin _$Food {
  @JsonKey(name: "food_id")
  int get food_id => throw _privateConstructorUsedError;
  @JsonKey(name: "food_name")
  String get food_name => throw _privateConstructorUsedError;
  @JsonKey(name: "food_desc")
  String get food_desc => throw _privateConstructorUsedError;
  @JsonKey(name: "food_image")
  String get food_image => throw _privateConstructorUsedError;
  @JsonKey(name: "food_price")
  double get food_price => throw _privateConstructorUsedError;
  @JsonKey(name: "food_calories")
  int get food_calories => throw _privateConstructorUsedError;
  @JsonKey(name: "ratings")
  double get ratings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodCopyWith<Food> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodCopyWith<$Res> {
  factory $FoodCopyWith(Food value, $Res Function(Food) then) =
      _$FoodCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "food_id") int food_id,
      @JsonKey(name: "food_name") String food_name,
      @JsonKey(name: "food_desc") String food_desc,
      @JsonKey(name: "food_image") String food_image,
      @JsonKey(name: "food_price") double food_price,
      @JsonKey(name: "food_calories") int food_calories,
      @JsonKey(name: "ratings") double ratings});
}

/// @nodoc
class _$FoodCopyWithImpl<$Res> implements $FoodCopyWith<$Res> {
  _$FoodCopyWithImpl(this._value, this._then);

  final Food _value;
  // ignore: unused_field
  final $Res Function(Food) _then;

  @override
  $Res call({
    Object? food_id = freezed,
    Object? food_name = freezed,
    Object? food_desc = freezed,
    Object? food_image = freezed,
    Object? food_price = freezed,
    Object? food_calories = freezed,
    Object? ratings = freezed,
  }) {
    return _then(_value.copyWith(
      food_id: food_id == freezed
          ? _value.food_id
          : food_id // ignore: cast_nullable_to_non_nullable
              as int,
      food_name: food_name == freezed
          ? _value.food_name
          : food_name // ignore: cast_nullable_to_non_nullable
              as String,
      food_desc: food_desc == freezed
          ? _value.food_desc
          : food_desc // ignore: cast_nullable_to_non_nullable
              as String,
      food_image: food_image == freezed
          ? _value.food_image
          : food_image // ignore: cast_nullable_to_non_nullable
              as String,
      food_price: food_price == freezed
          ? _value.food_price
          : food_price // ignore: cast_nullable_to_non_nullable
              as double,
      food_calories: food_calories == freezed
          ? _value.food_calories
          : food_calories // ignore: cast_nullable_to_non_nullable
              as int,
      ratings: ratings == freezed
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_FoodCopyWith<$Res> implements $FoodCopyWith<$Res> {
  factory _$$_FoodCopyWith(_$_Food value, $Res Function(_$_Food) then) =
      __$$_FoodCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "food_id") int food_id,
      @JsonKey(name: "food_name") String food_name,
      @JsonKey(name: "food_desc") String food_desc,
      @JsonKey(name: "food_image") String food_image,
      @JsonKey(name: "food_price") double food_price,
      @JsonKey(name: "food_calories") int food_calories,
      @JsonKey(name: "ratings") double ratings});
}

/// @nodoc
class __$$_FoodCopyWithImpl<$Res> extends _$FoodCopyWithImpl<$Res>
    implements _$$_FoodCopyWith<$Res> {
  __$$_FoodCopyWithImpl(_$_Food _value, $Res Function(_$_Food) _then)
      : super(_value, (v) => _then(v as _$_Food));

  @override
  _$_Food get _value => super._value as _$_Food;

  @override
  $Res call({
    Object? food_id = freezed,
    Object? food_name = freezed,
    Object? food_desc = freezed,
    Object? food_image = freezed,
    Object? food_price = freezed,
    Object? food_calories = freezed,
    Object? ratings = freezed,
  }) {
    return _then(_$_Food(
      food_id: food_id == freezed
          ? _value.food_id
          : food_id // ignore: cast_nullable_to_non_nullable
              as int,
      food_name: food_name == freezed
          ? _value.food_name
          : food_name // ignore: cast_nullable_to_non_nullable
              as String,
      food_desc: food_desc == freezed
          ? _value.food_desc
          : food_desc // ignore: cast_nullable_to_non_nullable
              as String,
      food_image: food_image == freezed
          ? _value.food_image
          : food_image // ignore: cast_nullable_to_non_nullable
              as String,
      food_price: food_price == freezed
          ? _value.food_price
          : food_price // ignore: cast_nullable_to_non_nullable
              as double,
      food_calories: food_calories == freezed
          ? _value.food_calories
          : food_calories // ignore: cast_nullable_to_non_nullable
              as int,
      ratings: ratings == freezed
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Food implements _Food {
  _$_Food(
      {@JsonKey(name: "food_id") this.food_id = 0,
      @JsonKey(name: "food_name") this.food_name = "",
      @JsonKey(name: "food_desc") this.food_desc = "",
      @JsonKey(name: "food_image") this.food_image = " ",
      @JsonKey(name: "food_price") this.food_price = 0.0,
      @JsonKey(name: "food_calories") this.food_calories = 0,
      @JsonKey(name: "ratings") this.ratings = 0.0});

  factory _$_Food.fromJson(Map<String, dynamic> json) => _$$_FoodFromJson(json);

  @override
  @JsonKey(name: "food_id")
  final int food_id;
  @override
  @JsonKey(name: "food_name")
  final String food_name;
  @override
  @JsonKey(name: "food_desc")
  final String food_desc;
  @override
  @JsonKey(name: "food_image")
  final String food_image;
  @override
  @JsonKey(name: "food_price")
  final double food_price;
  @override
  @JsonKey(name: "food_calories")
  final int food_calories;
  @override
  @JsonKey(name: "ratings")
  final double ratings;

  @override
  String toString() {
    return 'Food(food_id: $food_id, food_name: $food_name, food_desc: $food_desc, food_image: $food_image, food_price: $food_price, food_calories: $food_calories, ratings: $ratings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Food &&
            const DeepCollectionEquality().equals(other.food_id, food_id) &&
            const DeepCollectionEquality().equals(other.food_name, food_name) &&
            const DeepCollectionEquality().equals(other.food_desc, food_desc) &&
            const DeepCollectionEquality()
                .equals(other.food_image, food_image) &&
            const DeepCollectionEquality()
                .equals(other.food_price, food_price) &&
            const DeepCollectionEquality()
                .equals(other.food_calories, food_calories) &&
            const DeepCollectionEquality().equals(other.ratings, ratings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(food_id),
      const DeepCollectionEquality().hash(food_name),
      const DeepCollectionEquality().hash(food_desc),
      const DeepCollectionEquality().hash(food_image),
      const DeepCollectionEquality().hash(food_price),
      const DeepCollectionEquality().hash(food_calories),
      const DeepCollectionEquality().hash(ratings));

  @JsonKey(ignore: true)
  @override
  _$$_FoodCopyWith<_$_Food> get copyWith =>
      __$$_FoodCopyWithImpl<_$_Food>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FoodToJson(this);
  }
}

abstract class _Food implements Food {
  factory _Food(
      {@JsonKey(name: "food_id") final int food_id,
      @JsonKey(name: "food_name") final String food_name,
      @JsonKey(name: "food_desc") final String food_desc,
      @JsonKey(name: "food_image") final String food_image,
      @JsonKey(name: "food_price") final double food_price,
      @JsonKey(name: "food_calories") final int food_calories,
      @JsonKey(name: "ratings") final double ratings}) = _$_Food;

  factory _Food.fromJson(Map<String, dynamic> json) = _$_Food.fromJson;

  @override
  @JsonKey(name: "food_id")
  int get food_id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "food_name")
  String get food_name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "food_desc")
  String get food_desc => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "food_image")
  String get food_image => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "food_price")
  double get food_price => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "food_calories")
  int get food_calories => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "ratings")
  double get ratings => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FoodCopyWith<_$_Food> get copyWith => throw _privateConstructorUsedError;
}
