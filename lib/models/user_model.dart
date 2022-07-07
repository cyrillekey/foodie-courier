import 'package:drift/drift.dart' show Expression, Insertable, Value;
import 'package:foodie_courier/database/local_db.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.g.dart';
part 'user_model.freezed.dart';

@freezed
class User with _$User implements Insertable<User> {
  const User._();
  factory User(
      {@Default(0) @JsonKey(name: "customer_id") int customer_id,
      @Default("") @JsonKey(name: "user_mail") String user_mail,
      @Default("") @JsonKey(name: "user_name") String user_name,
      @Default(" ") @JsonKey(name: "user_phone") String user_phone,
      @Default("CUSTOMER") @JsonKey(name: "accountType") String accountType,
      @Default("") @JsonKey(name: "dateJoined") String dateJoined,
      @Default("") @JsonKey(name: "accountStatus") String accountStatus,
      @Default("") @JsonKey(name: "profile_picture") String profile_picture,
      @JsonKey(name: "password") @Default("") String password}) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return UserTableCompanion(
            customer_id: Value(customer_id),
            user_mail: Value(user_mail),
            user_name: Value(user_name),
            user_phone: Value(user_phone),
            accountType: Value(accountType),
            dateJoined: Value(dateJoined),
            accountStatus: Value(accountStatus),
            profile_picture: Value(profile_picture),
            password: Value(password))
        .toColumns(nullToAbsent);
  }
}
