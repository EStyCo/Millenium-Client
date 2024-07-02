import 'package:client/services/handlers/battle_place_handler.dart';
import 'package:client/widgets/active_users_list_widget.dart';
import 'package:client/widgets/spell_list_widget.dart';
import 'package:client/widgets/health_bar_widget.dart';
import 'package:client/widgets/buff_bar_widget.dart';
import 'package:client/widgets/divider_widget.dart';
import 'package:client/widgets/routes_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SpecialPlaceScreen extends StatelessWidget {
  SpecialPlaceScreen({super.key});

  final handler = GetIt.I<BattlePlaceHandler>();

  @override
  Widget build(BuildContext context) {
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
                            'assets/images/locations/masturbation.png',
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
                        child: const Center(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              'Добро пожаловать в дрочильню!\nНаслаждайтесь..',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
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
