import 'package:dio/dio.dart';
import 'package:foodie_courier/api_client/api_client.dart';
import 'package:foodie_courier/constants/api_url.dart';
import 'package:foodie_courier/database/local_db.dart';
import 'package:foodie_courier/database/local_db_dao.dart';
import 'package:foodie_courier/database/shared_database.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

GetIt locator = GetIt.instance;
final AppDatabase _appDatabase = AppDatabase(constructDb().executor);
var logger = Logger(
    printer: PrettyPrinter(
  methodCount: 1,
  errorMethodCount: 8,
  lineLength: 120,
  colors: true,
  printEmojis: true,
  printTime: true,
));
void setupLocator() {
  locator.registerSingleton(ApiClient(ApiUrl.baseUrl, Dio()));
  locator.registerSingleton(LocalDaoDb(_appDatabase));
}
