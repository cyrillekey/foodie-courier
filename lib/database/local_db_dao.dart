import 'package:drift/drift.dart';
import 'package:foodie_courier/database/local_db.dart';
import 'package:foodie_courier/models/courier_model.dart';
import 'package:foodie_courier/models/user_model.dart';
import 'package:foodie_courier/services/service_locator.dart';
part 'local_db_dao.g.dart';

@DriftAccessor(tables: [UserTable, CourierTable])
class LocalDaoDb extends DatabaseAccessor<AppDatabase> with _$LocalDaoDbMixin {
  LocalDaoDb(AppDatabase db) : super(db);
  Future<void> saveUser(User user) async {
    userTable.delete().go();
    userTable.insert().insert(user).then((value) => logger.i(value));
  }

  Future<void> saveCourier(Courier courier) async {
    courierTable.delete().go();
    courierTable.insert().insert(courier).then((value) => logger.i(value));
  }

  logout() async {
    delete(userTable).go();
    return delete(courierTable).go();
  }

  Future<User?> getUser() async {
    return select(userTable).getSingleOrNull();
  }
}
