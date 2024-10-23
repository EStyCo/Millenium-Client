import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/bloc/details_monster/details_monster_bloc.dart';
import 'package:client/bloc/details_monster/details_monster_state.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/services/handlers/battle_place_handler.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    Color changeColor(int index) {
      if (provider.listMonster[index].id == provider.targetIndex) {
        return Colors.black12;
      }
      return Colors.white;
    }

    Duration setDuration(int index) {
      if (provider.listMonster[index].id == provider.targetIndex) {
        return const Duration(milliseconds: 250);
      }
      return Duration.zero;
    }

    void showDetails(BuildContext context, int index) {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return BlocBuilder<DetailsMonsterBloc, DetailsMonsterState>(
            builder: (context, state) {
              return state;
            },
          );
        },
      );
    }

    if (provider.listMonster.isEmpty) {
      return const CircularProgressIndicator();
    } else {
      return Column(
        children: List.generate(
          provider.listMonster.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AnimatedContainer(
                  color: changeColor(index),
                  duration: setDuration(index),
                  curve: Curves.easeOutQuad,
                  child: ListTile(
                    splashColor: Colors.transparent,
                    leading: InkWell(
                      onTap: () {
                        showDetails(context, index);
                        BlocProvider.of<DetailsMonsterBloc>(context).add(index);
                      },
                      child: CircleAvatar(
                        radius: 25,
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl:
                                '${BaseUrl.Get()}/imageProvider/${provider.listMonster[index].imagePath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
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
                            radius: 16,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl:
                                    '${BaseUrl.Get()}/imageProvider/${item.imagePath}',
                                fit: BoxFit.cover,
                              ),
                            ),
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
