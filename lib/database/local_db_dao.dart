import 'package:drift/drift.dart';
import 'package:foodie_courier/database/local_db.dart';
import 'package:foodie_courier/models/courier_model.dart';
import 'package:foodie_courier/models/user_model.dart';
part 'local_db_dao.g.dart';

@DriftAccessor(tables: [UserTable, CourierTable])
class LocalDaoDb extends DatabaseAccessor<AppDatabase> with _$LocalDaoDbMixin {
  LocalDaoDb(AppDatabase db) : super(db);
  Future<void> saveUser(User user) async {
    userTable.insert().insert(user);
  }

  Future<void> saveCourier(Courier courier) async {
    courierTable.insert().insert(courier);
  }

  logout() async {
    delete(userTable);
    return delete(courierTable);
  }

  Future<User> getUser() async {
    return select(userTable).getSingle();
  }
}
