import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/services/handlers/battle_place_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class ActiveUsersListWidget extends ConsumerWidget {
  ActiveUsersListWidget({super.key});

  final handler = GetIt.I<BattlePlaceHandler>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider =
        ref.watch(ChangeNotifierProvider<BattlePlaceHandler>((ref) => handler));

    Color _changeColor(int index) {
      if (provider.listUsers[index].name == provider.targetName) {
        return Colors.black12;
      } else {
        return Colors.white;
      }
    }

    if (provider.listUsers.isEmpty) {
      return const Text('Загрузка..');
    } else {
      return Column(
        children: List.generate(
          provider.listUsers.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AnimatedContainer(
                  color: _changeColor(index),
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutQuad,
                  child: ListTile(
                    splashColor: Colors.transparent,
                    leading: InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.black12,
                        child: CachedNetworkImage(
                                      imageUrl:
                                          '${BaseUrl.Get()}/imageProvider/characters/warrior.jpg'),
                        //Image.asset('assets/images/warrior_image.jpg'),
                      ),
                    ),
                    title: Text(
                        '${provider.listUsers[index].name} [${provider.listUsers[index].level} lvl]'),
                    subtitle: provider.placeInfo.canAttackUser
                        ? Row(
                            children: [
                              Text(
                                '${provider.listUsers[index].currentHP}/${provider.listUsers[index].maxHP}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              for (var item in provider.listUsers[index].states)
                                CircleAvatar(
                                  radius: 15,
                                  child: CachedNetworkImage(
                                      imageUrl:
                                          '${BaseUrl.Get()}/imageProvider/${item.imagePath}'),
                                  // AssetImage(
                                  //     'assets/images/spells/${item.imagePath}'),
                                ),
                            ],
                          )
                        : null,
                    onTap: () {
                      if (provider.placeInfo.canAttackUser) {
                        provider.pickUser(provider.listUsers[index].name);
                      }
                    },
                  ),
                ),
              ),
            );
          },
          // ListTile(
          //   contentPadding: EdgeInsets.zero,
          //   tileColor: changeColor(index),
          //   leading: InkWell(
          //     onTap: () {},
          //     child: CircleAvatar(
          //       radius: 25,
          //       backgroundColor: Colors.black12,
          //       child: Image.asset('assets/images/warrior_image.jpg'),
          //     ),
          //   ),
          //   title: Text(
          //     '[${provider.listUsers[index].level}] ${provider.listUsers[index].name}',
          //   ),
          //   onTap: () {
          //     provider.pickUser(provider.listUsers[index].name);
          //   },
          // ),
        ),
      );
    }
  }
}
