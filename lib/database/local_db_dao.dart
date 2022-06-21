import 'package:drift/drift.dart';
import 'package:foodie_courier/database/local_db.dart';
part 'local_db_dao.g.dart';

@DriftAccessor(tables: [UserTable, CourierTable])
class LocalDaoDb extends DatabaseAccessor<AppDatabase> with _$LocalDaoDbMixin {
  LocalDaoDb(AppDatabase db) : super(db);
}
