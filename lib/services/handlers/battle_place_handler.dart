import 'package:client/models/Place/connect_to_place_hub.dart';
import 'package:client/models/Place/details_monster.dart';
import 'package:client/models/Place/details_monster_request.dart';
import 'package:client/models/Place/place_info.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/models/Place/active_user.dart';
import 'package:client/models/Place/monster.dart';
import 'package:client/services/web/place_service.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BattlePlaceHandler extends ChangeNotifier {
  final storage = GetIt.I<UserStorage>();

  late String serverUrl;
  late HubConnection hubConnection = HubConnectionBuilder().withUrl('').build();
  late int targetIndex = -1;
  late String targetName = '';
  late List<Monster> listMonster = [];
  late List<ActiveUser> listUsers = [];
  late List<String> routes = [];
  late bool isExpanded = false;
  late PlaceInfo placeInfo = PlaceInfo();

  void pickMonster(int index) {
    targetName = '';
    if (targetIndex == index) {
      targetIndex = -1;
    } else {
      targetIndex = index;
    }
    notifyListeners();
    print('target index: $targetIndex');
    print('target name: $targetName');
  }

  void pickUser(String name) {
    targetIndex = -1;
    targetName = name;
    notifyListeners();
  }

  void clearMonsters() {
    targetIndex = -1;
    listMonster.clear();
  }

  Future stopConnection() async {
    clearMonsters();
    targetName = '';
    placeInfo = PlaceInfo();
    hubConnection.stop();
    print(
        'Monster handler: Состояние подключения - ${hubConnection.state.toString()}');
  }

  void _updateListMonsters(List<dynamic>? args) {
    listMonster.clear();
    if (args != null) {
      for (var item in args[0]) {
        var monster = Monster.fromJson(item);
        listMonster.add(monster);
      }
      notifyListeners();
    }
  }

  void _updateListUsers(List<dynamic>? args) {
    listUsers.clear();
    if (args != null) {
      for (var item in args[0]) {
        var user = ActiveUser.fromJson(item);
        listUsers.add(user);
      }
      notifyListeners();
    }
  }

  Future<DetailsMonster?> getDetailsMonster(int index) async {
    final response = await PlaceService().getDetailsMonster(
      DetailsMonsterRequest(
          place: storage.character.place, id: listMonster[index].id),
    );

    if (response.isSuccess) {
      return DetailsMonster.fromJson(response.result!);
    } else {
      return null;
    }
  }

  void _updateDescription(Map<String, dynamic>? args) {
    if (args != null) {
      placeInfo = PlaceInfo.fromJson(args);
      notifyListeners();
    }
  }

  void _updateRoutes(List<dynamic>? args) {
    routes.clear();
    if (args != null) {
      for (var item in args) {
        if (item is String && item.isNotEmpty) routes.add(item);
      }
      notifyListeners();
    }
  }

  Future<void> initializeSignalR(String namePlace) async {
    serverUrl = '${BaseUrl.Get()}/PlaceHub';
    final name = GetIt.I<UserStorage>().character.name;
    hubConnection = HubConnectionBuilder().withUrl(serverUrl).build();

    hubConnection.keepAliveIntervalInMilliseconds = 3000000;

    hubConnection.on('UpdateListMonsters', _updateListMonsters);
    hubConnection.on('UpdateListUsers', _updateListUsers);
    hubConnection.on('ResetTarget', ((args) => targetIndex = -1));

    if (hubConnection.state != HubConnectionState.connected) {
      await hubConnection.start();
      await hubConnection.invoke('ConnectToHub',
          args: [ConnectToPlaceHub(name: name, place: namePlace)]);
      _updateDescription(
          await hubConnection.invoke('UpdateDescription', args: [namePlace]));
      _updateRoutes(
          await hubConnection.invoke('UpdateRoutes', args: [namePlace]));
    }

    print('Состояние подключения - ${hubConnection.state}');
  }
}
