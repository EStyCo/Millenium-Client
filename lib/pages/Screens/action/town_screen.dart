import 'package:client/bloc/action_screen/action_screen_bloc.dart';
import 'package:client/bloc/action_screen/action_screen_event.dart';
import 'package:client/widgets/divider_widget.dart';
import 'package:client/widgets/health_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TownScreen extends StatelessWidget {
  const TownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ActionScreenBloc actionBloc =
        BlocProvider.of<ActionScreenBloc>(context);

    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: HealthBarWidget(),
          ),
          const MyDivider(),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Align(
                  alignment: Alignment.center,
                  heightFactor: 150 / (250 + 70),
                  child: Image.asset(
                    'assets/images/locations/town.jpeg',
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
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Славный город Миллениум, пристанище путников и торговцев, многие здесь находят свое предназначение.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5),
            child: Divider(),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ElevatedButton(
                  onPressed: null,
                  child: Text('Администрация'),
                ),
                const ElevatedButton(
                  onPressed: null,
                  child: Text('Рынок'),
                ),
                const ElevatedButton(
                  onPressed: null,
                  child: Text('Таверна'),
                ),
                ElevatedButton(
                  onPressed: () {
                    actionBloc.add(MentorScreenEvent());
                  },
                  child: const Text('Великий мастер'),
                ),
                ElevatedButton(
                  onPressed: () {
                    actionBloc.add(GladeScreenEvent());
                  },
                  child: const Text('На Поляну'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
