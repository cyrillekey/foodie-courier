import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.g.dart';
part 'user_model.freezed.dart';

@freezed
class User with _$User {
  factory User(
          {@Default(0) @JsonKey(name: "customer_id") int customer_id,
          @Default("") @JsonKey(name: "user_mail") String user_mail,
          @Default("") @JsonKey(name: "user_name") String user_name,
          @Default(" ") @JsonKey(name: "user_phone") String user_phone,
          @Default("CUSTOMER") @JsonKey(name: "accountType") String accountType,
          @Default("") @JsonKey(name: "dateJoined") String dateJoined,
          @Default("") @JsonKey(name: "accountStatus") String accountStatus}) =
      _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
