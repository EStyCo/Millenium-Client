import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/services/handlers/battle_place_handler.dart';
import 'package:client/widgets/active_users_list_widget.dart';
import 'package:client/widgets/monster_list_widget.dart';
import 'package:client/widgets/routes_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:client/widgets/spell_list_widget.dart';
import 'package:client/widgets/health_bar_widget.dart';
import 'package:client/widgets/buff_bar_widget.dart';
import 'package:client/widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BattlePlaceScreen extends ConsumerWidget {
  BattlePlaceScreen({super.key});

  final handler = GetIt.I<BattlePlaceHandler>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(
      ChangeNotifierProvider<BattlePlaceHandler>(
        (ref) => handler,
      ),
    );

    Widget? _getImage(BuildContext context) {
      if (provider.placeInfo.imagePath.isEmpty) {
        return null;
      } else {
        return CachedNetworkImage(
          imageUrl:
              '${BaseUrl.Get()}/imageProvider/${provider.placeInfo.imagePath}',
          fit: BoxFit.cover,
          width: double.infinity,
        );
      }
    }

    return SizedBox(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: HealthBarWidget(),
                ),
                const MyDivider(),
                BuffBarWidget()
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                        minHeight: 200, minWidth: 200, maxWidth: 800),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Align(
                            alignment: Alignment.center,
                            heightFactor: 200 / (350 + 50),
                            child: _getImage(context)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15, top: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        color: Colors.black12,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              provider.placeInfo.description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const MyDivider(),
                  RoutesWidget(),
                  const MyDivider(),
                  ExpansionTile(
                    title: const Text('Игроки'),
                    backgroundColor: Colors.white,
                    collapsedBackgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    children: [ActiveUsersListWidget()],
                  ),
                  const MyDivider(),
                  ExpansionTile(
                    onExpansionChanged: (value) =>
                        GetIt.I<BattlePlaceHandler>().isExpanded = value,
                    initiallyExpanded: GetIt.I<BattlePlaceHandler>().isExpanded,
                    title: const Text('Монстры'),
                    collapsedBackgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    children: [
                      MonsterListWidget(),
                    ],
                  ),
                  const SizedBox(height: 150),
                ],
              ),
            ),
          ),
          SpellListWidget(),
        ],
      ),
    );
  }
}
