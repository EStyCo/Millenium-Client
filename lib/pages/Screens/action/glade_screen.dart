import 'package:client/bloc/action_screen/action_screen_bloc.dart';
import 'package:client/bloc/action_screen/action_screen_event.dart';
import 'package:client/models/Place/place.dart';
import 'package:client/services/handlers/monster_list_handler.dart';
import 'package:client/services/web/monster_service.dart';
import 'package:client/widgets/active_users_list_widget.dart';
import 'package:client/widgets/buff_bar_widget.dart';
import 'package:client/widgets/divider_widget.dart';
import 'package:client/widgets/health_bar_widget.dart';
import 'package:client/widgets/monster_list_widget.dart';
import 'package:client/widgets/spell_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class GladeScreen extends StatefulWidget {
  GladeScreen({super.key});
  final handler = GetIt.I<MonsterListHandler>();

  @override
  State<GladeScreen> createState() => GladeState();
}

class GladeState extends State<GladeScreen> {
  @override
  Widget build(BuildContext context) {
    final ActionScreenBloc actionBloc =
        BlocProvider.of<ActionScreenBloc>(context);
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
                            'assets/images/locations/glade.jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Перейти',
                      style: TextStyle(fontSize: 15),
                    ),
                    backgroundColor: Colors.white,
                    collapsedBackgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                actionBloc.add(TownScreenEvent());
                              },
                              child: const Text('В город'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                actionBloc.add(TownScreenEvent());
                              },
                              child: const Text('Дальше'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                MonsterService()
                                    .addMonster(const Place(place: 'glade'));
                              },
                              child: const Text('+mnstr'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                  ExpansionTile(
                    onExpansionChanged: (value) =>
                        GetIt.I<MonsterListHandler>().isExpanded = value,
                    initiallyExpanded: GetIt.I<MonsterListHandler>().isExpanded,
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
