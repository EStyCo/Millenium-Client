import 'package:client/services/handlers/buff_bar_handler.dart';
import 'package:client/services/handlers/logs_list_handler.dart';
import 'package:client/services/handlers/battle_place_handler.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:get_it/get_it.dart';

void setupGetIt() {
  GetIt.I.registerSingleton<UserStorage>(UserStorage());
  GetIt.I.registerLazySingleton<HealthBarHandler>(() => HealthBarHandler());
  GetIt.I.registerLazySingleton<BuffBarHandler>(() => BuffBarHandler());
  GetIt.I.registerLazySingleton<BattlePlaceHandler>(() => BattlePlaceHandler());
  GetIt.I.registerLazySingleton<LogsListHandler>(() => LogsListHandler());
}
