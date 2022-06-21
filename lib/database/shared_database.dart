import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'local_db.dart';

AppDatabase constructDb() {
  return AppDatabase(LazyDatabase(
    () async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(join(dbFolder.path, 'foodie.sqlite'));
      return NativeDatabase(file);
    },
  ));
}
