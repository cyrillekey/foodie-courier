import 'package:drift/drift.dart';
import 'package:foodie_courier/models/user_model.dart';
part 'local_db.g.dart';

@DriftDatabase(tables: [UserTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);
  @override
  int get schemaVersion => 1;
}

@UseRowClass(User)
class UserTable extends Table {
  IntColumn get customer_id => integer()();
  TextColumn get user_mail => text()();
  TextColumn get user_name => text()();
  TextColumn get user_phone => text()();
  TextColumn get accountType => text()();
  TextColumn get dateJoined => text()();
  TextColumn get accountStatus => text()();
  @override
  Set<Column> get primaryKey => {customer_id};
}
