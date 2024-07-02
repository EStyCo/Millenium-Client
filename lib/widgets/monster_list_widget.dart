import 'package:client/services/handlers/battle_place_handler.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class MonsterListWidget extends ConsumerWidget {
  MonsterListWidget({super.key});

  final handler = GetIt.I<BattlePlaceHandler>();
  final storage = GetIt.I<UserStorage>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(
      ChangeNotifierProvider<BattlePlaceHandler>(
        (ref) => handler,
      ),
    );

    Color _changeColor(int index) {
      if (provider.listMonster[index].id == provider.targetIndex) {
        return Colors.black12;
      }
      return Colors.white;
    }

    Duration _setDuration(int index) {
      if (provider.listMonster[index].id == provider.targetIndex) {
        return const Duration(milliseconds: 250);
      }
      return Duration.zero;
    }

    if (provider.listMonster.isEmpty) {
      return const CircularProgressIndicator();
    } else {
      return Column(
        children: List.generate(
          provider.listMonster.length,
          (index) {
            //String imagePath =
            //'assets/images/monsters/${provider.listMonster[index].imagePath}';
            return Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AnimatedContainer(
                  color: _changeColor(index),
                  duration: _setDuration(index),
                  curve: Curves.easeOutQuad,
                  child: ListTile(
                    splashColor: Colors.transparent,
                    leading: InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.black12,
                          child: Image.asset(
                              'assets/images/monsters/${provider.listMonster[index].imagePath}')),
                    ),
                    title: Row(
                      children: [
                        if (provider.listMonster[index].target ==
                            storage.character.name)
                          const Icon(
                            Icons.track_changes_outlined,
                            color: Colors.red,
                          ),
                        Text(
                          '${provider.listMonster[index].name} [id${provider.listMonster[index].id}]',
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          '${provider.listMonster[index].currentHP}/${provider.listMonster[index].maxHP}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        for (var item in provider.listMonster[index].states)
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage(
                                'assets/images/spells/${item.imagePath}'),
                          ),
                      ],
                    ),
                    onTap: () {
                      provider.pickMonster(provider.listMonster[index].id);
                    },
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
