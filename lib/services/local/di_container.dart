import 'package:client/services/handlers/logs_list_handler.dart';
import 'package:client/services/handlers/monster_list_handler.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:get_it/get_it.dart';

void setupGetIt() {
  GetIt.I.registerSingleton<UserStorage>(UserStorage());
  GetIt.I.registerLazySingleton<CharacterHUD>(() => CharacterHUD());
  GetIt.I.registerLazySingleton<MonsterListHandler>(() => MonsterListHandler());
  GetIt.I.registerLazySingleton<LogsListHandler>(() => LogsListHandler());
}
