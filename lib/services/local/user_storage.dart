import 'dart:async';
import 'package:client/models/LoginPage/Character/character.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/services/handlers/auth_handler.dart';
import 'package:client/services/handlers/buff_bar_handler.dart';
import 'package:client/services/handlers/logs_list_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:signalr_core/signalr_core.dart';

class UserStorage {
  late Character character;
}

class HealthBarHandler extends ChangeNotifier {
  final storage = GetIt.I<UserStorage>();
  final logsHandler = GetIt.I<LogsListHandler>();
  final buffBarHandler = GetIt.I<BuffBarHandler>();

  final characterHUDProvider = ChangeNotifierProvider<HealthBarHandler>((ref) {
    return GetIt.I<HealthBarHandler>();
  });

  int _currentHP = 0;
  int get currentHP => _currentHP;
  int _currentMP = 0;
  int get currentMP => _currentMP;
  int _maxHP = 0;
  int get maxHP => _maxHP;
  int _maxMP = 100;
  int get maxMP => _maxMP;

  static String serverUrl = '${BaseUrl.Get()}/UserStorage';
  final hubConnection = HubConnectionBuilder().withUrl(serverUrl).build();

  Future<void> connectHub(BuildContext context) async {
    hubConnection.keepAliveIntervalInMilliseconds = 3000000;
    hubConnection.on('UpdateHP', _handleUpdateHP);
    hubConnection.on('UpdateMP', _handleUpdateMP);
    hubConnection.on('UpdateLogs', logsHandler.updatelogList);
    hubConnection.on('UpdateBuffBar', buffBarHandler.updateBuffBar);
    hubConnection.onclose(
      (exception) async {
        if (hubConnection.state == HubConnectionState.disconnected) {
          //_reconnecting(context);
          await hubConnection.start();
          await hubConnection
              .invoke('ConnectHub', args: [storage.character.name]);
        }
      },
    );

    if (hubConnection.state != HubConnectionState.connected) {
      await hubConnection.start();
      await hubConnection.invoke('ConnectHub', args: [storage.character.name]);
    }
  }

  Future<void> _handleUpdateHP(List<dynamic>? args) async {
    if (args != null) {
      List<int> newHP = [];
      for (var item in args[0]) {
        newHP.add(item as int);
      }
      _currentHP = newHP[0];
      _maxHP = newHP[1];
      notifyListeners();
    }
  }

  Future<void> _handleUpdateMP(List<dynamic>? args) async {
    if (args != null) {
      List<int> newMP = [];
      for (var item in args[0]) {
        newMP.add(item as int);
      }
      _currentMP = newMP[0];
      _maxMP = newMP[1];
      notifyListeners();
    }
  }

  // _reconnecting(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false, // Диалог нельзя закрыть, нажав вне его
  //     builder: (BuildContext context) {
  //       return WillPopScope(
  //         onWillPop: () async => false, // Блокируем кнопку назад
  //         child: AlertDialog(
  //           title: Text('Не закрываемый алерт'),
  //           content: SingleChildScrollView(
  //             child: ListBody(
  //               children: <Widget>[
  //                 Text('Этот диалог нельзя закрыть.'),
  //                 Text('Никаким образом.'),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
