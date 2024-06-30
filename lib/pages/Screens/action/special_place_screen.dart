import 'package:client/services/handlers/battle_place_handler.dart';
import 'package:client/widgets/active_users_list_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:client/widgets/spell_list_widget.dart';
import 'package:client/widgets/health_bar_widget.dart';
import 'package:client/widgets/buff_bar_widget.dart';
import 'package:client/widgets/divider_widget.dart';
import 'package:client/widgets/routes_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SpecialPlaceScreen extends ConsumerWidget {
  SpecialPlaceScreen({super.key});

  final handler = GetIt.I<BattlePlaceHandler>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final provider = ref.watch(
      ChangeNotifierProvider<BattlePlaceHandler>(
        (ref) => handler,
      ),
    );

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
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Align(
                          alignment: Alignment.center,
                          heightFactor: 200 / (350 + 50),
                          child: Image.asset(
                            //provider.imagePath,
                            'assets/images/locations/${provider.placeInfo.imagePath}',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
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
                  const ExpansionTile(
                    title: Text('Игроки'),
                    backgroundColor: Colors.white,
                    collapsedBackgroundColor: Colors.white,
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    children: [ActiveUsersListWidget()],
                  ),
                  const MyDivider(),
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
