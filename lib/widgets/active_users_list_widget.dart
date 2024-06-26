import 'package:client/services/handlers/battle_place_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class ActiveUsersListWidget extends ConsumerStatefulWidget {
  const ActiveUsersListWidget({super.key});

  @override
  ConsumerState<ActiveUsersListWidget> createState() {
    return ActiveUsersListWidgetState();
  }
}

class ActiveUsersListWidgetState extends ConsumerState<ActiveUsersListWidget> {
  final handler = GetIt.I<BattlePlaceHandler>();

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(
      ChangeNotifierProvider<BattlePlaceHandler>(
        (ref) => handler,
      ),
    );

    Color changeColor(int index) {
      if (provider.listMonster[index].id == provider.targetIndex) {
        return Colors.black12;
      } else {
        return Colors.white;
      }
    }

    if (provider.listMonster.isEmpty) {
      return const CircularProgressIndicator();
    } else {
      return Column(
        children: List.generate(
          provider.listUsers.length,
          (index) => ListTile(
            contentPadding: EdgeInsets.zero,
            tileColor: changeColor(index),
            leading: InkWell(
              onTap: () {},
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.black12,
                child: Image.asset('assets/images/warrior_image.jpg'),
              ),
            ),
            title: Text(
              '[${provider.listUsers[index].level}] ${provider.listUsers[index].name}',
            ),
          ),
        ),
      );
    }
  }
}
