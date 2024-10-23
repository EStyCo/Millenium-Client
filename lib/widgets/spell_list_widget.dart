import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/services/handlers/spell_list_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';

class SpellListWidget extends ConsumerStatefulWidget {
  const SpellListWidget({super.key});

  @override
  SpellListWidgetState createState() => SpellListWidgetState();
}

class SpellListWidgetState extends ConsumerState<SpellListWidget> {
  late Timer timer;

  final spellListProvider = ChangeNotifierProvider<SpellListHandler>(
    (ref) => SpellListHandler(),
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

    String textSpell(int index) {
      if (provider.spellList[index].restSeconds > 0) {
        return provider.spellList[index].restSeconds.toString();
      } else if (!provider.canAttack) {
        return provider.globalRestSeconds.toString();
      } else {
        return '';
      }
    }

    Widget filter(int index) {
      return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: provider.spellList[index].isReady ? 0.0 : 5.0,
          sigmaY: provider.spellList[index].isReady ? 0.0 : 5.0,
        ),
        child: Container(
          color: Colors.transparent,
        ),
      );
    }

    if (provider.spellList.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: Center(
          child: Text(
            'Нет активных способностей.',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else {
      return Container(
        color: Colors.transparent,
        constraints: const BoxConstraints(maxHeight: 70),
        child: ListView.builder(
          padding: const EdgeInsets.all(5),
          scrollDirection: Axis.horizontal,
          itemCount: provider.spellList.length,
          itemBuilder: (context, index) {
            double padding =
                (index == 0 || index == provider.spellList.length - 1) ? 0 : 5;
            return InkWell(
              onTap: !provider.spellList[index].isReady || !provider.canAttack
                  ? null
                  : () {
                      provider.useSpell(provider.spellList[index].spellType);
                    },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Container(
                  margin: EdgeInsets.only(left: padding, right: padding),
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.black12,
                  ),
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl:
                                    '${BaseUrl.Get()}/imageProvider/${provider.spellList[index].imagePath}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned.fill(child: filter(index)),
                          Text(
                            textSpell(index),
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(width: 5),
                      Text(
                        provider.spellList[index].name,
                        style: const TextStyle(fontSize: 13),
                        textAlign: TextAlign.center,
                      ),
                    ],
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
