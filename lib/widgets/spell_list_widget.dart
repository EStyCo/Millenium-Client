import 'dart:async';
import 'dart:ui';
import 'package:client/services/handlers/spell_list_handler.dart';
import 'package:client/services/handlers/monster_list_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class SpellListWidget extends ConsumerStatefulWidget {
  SpellListWidget({super.key});
  final MonsterListHandler monsterHandler = GetIt.I<MonsterListHandler>();

  @override
  SpellListWidgetState createState() => SpellListWidgetState();
}

class SpellListWidgetState extends ConsumerState<SpellListWidget> {
  late Timer timer;
  final spellListProvider = ChangeNotifierProvider<SpellListHandler>(
    (ref) {
      return SpellListHandler();
    },
  );

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    timerUpdateSpellList();
  }

  void timerUpdateSpellList() {
    final provider = ref.read(spellListProvider);
    provider.getSpellList();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      provider.getSpellList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(spellListProvider);
    if (provider.spellList.isEmpty) {
      return const CircularProgressIndicator();
    } else {
      return Container(
        color: Colors.transparent,
        constraints: const BoxConstraints(maxHeight: 70),
        child: ListView.builder(
          padding: const EdgeInsets.all(5),
          scrollDirection: Axis.horizontal,
          itemCount: provider.spellList.length,
          itemBuilder: (context, index) {
            double padding = 5;
            if (index == 0 || index == provider.spellList.length) {
              padding = 0;
            }
            return ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  margin: EdgeInsets.only(left: padding, right: padding),
                  width: 205,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black12),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        elevation: MaterialStateProperty.all<double>(0)),
                    onPressed: !provider.spellList[index].isReady
                        ? null
                        : () {
                            provider.attackMonster(
                                provider.spellList[index].spellType);
                          },
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                            'assets/images/spells/${provider.spellList[index].imagePath}'),
                      ),
                      title: Text(
                        provider.spellList[index].name,
                        style: const TextStyle(fontSize: 13),
                        textAlign: TextAlign.center,
                      ),
                      trailing: Text(
                          provider.spellList[index].restSeconds.toString(),
                          style: const TextStyle(fontSize: 15)),
                    ),
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
