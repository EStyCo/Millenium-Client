import 'package:client/bloc/action_screen/action_screen_bloc.dart';
import 'package:client/bloc/details_monster/details_monster_bloc.dart';
import 'package:client/bloc/equipment/equipment_bloc.dart';
import 'package:client/bloc/inventory/inventory_bloc.dart';
import 'package:client/pages/ModalPages/character_page.dart';
import 'package:client/pages/ModalPages/inventory_page.dart';
import 'package:client/services/local/di_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:client/pages/ModalPages/reg_page.dart';
import 'package:client/bloc/stats/stats_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:client/pages/default_page.dart';
import 'package:client/pages/auth_page.dart';
import 'package:flutter/material.dart';

void main() {
  setupGetIt();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ActionScreenBloc()),
        BlocProvider(create: (context) => StatsBloc()),
        BlocProvider(create: (context) => DetailsMonsterBloc()),
        BlocProvider(create: (context) => InventoryBloc()),
        BlocProvider(create: (context) => EquipmentBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 60, 57, 241)),
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => AuthPage(),
          '/main': (context) => const DefaultPage(),
          '/modalReg': (context) => RegModalPage(),
          '/modalChar': (context) => CharacterModalPage(),
          '/modalInv': (context) => const InventoryModalPage()
        },
      ),
    );
  }
}
