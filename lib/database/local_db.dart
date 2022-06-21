import 'package:drift/drift.dart';
import 'package:foodie_courier/models/courier_model.dart';
import 'package:foodie_courier/models/user_model.dart';
part 'local_db.g.dart';

@DriftDatabase(tables: [UserTable, CourierTable])
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

@UseRowClass(Courier)
class CourierTable extends Table {
  IntColumn get courier_id => integer()();
  TextColumn get id_number => text()();
  TextColumn get phone_number1 => text()();
  TextColumn get phone_number2 => text()();
  RealColumn get currentLatitude => real()();
  RealColumn get currentLongitude => real()();
  RealColumn get account_balance => real()();
  RealColumn get rating => real()();
  BoolColumn get onAssingment => boolean()();
  BoolColumn get currentStatus => boolean()();
  TextColumn get vehicle_registration => text()();
  @override
  Set<Column> get primaryKey => {courier_id};
}
