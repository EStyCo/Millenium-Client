import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/bloc/equipment/equipment_bloc.dart';
import 'package:client/bloc/equipment/equipment_event.dart';
import 'package:client/bloc/inventory/inventory_bloc.dart';
import 'package:client/bloc/inventory/inventory_event.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/widgets/divider_widget.dart';
import 'package:client/widgets/equipment_widget.dart';
import 'package:client/widgets/stats_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterModalPage extends StatelessWidget {
  CharacterModalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Millennium'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 214, 213, 213),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: IconButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, '/modalInv');
                  BlocProvider.of<InventoryBloc>(context)
                      .add(GetInventoryEvent());
                },
                icon: const Icon(Icons.inventory_2_outlined),
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Персонаж'),
              Tab(text: 'Модификаторы'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TabCharacterWidget(),
            TabModifiersWidget(),
          ],
        ),
      ),
    );
  }
}

class TabCharacterWidget extends StatelessWidget {
  const TabCharacterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EquipmentBloc>(context).add(GetEquipmentEvent());

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 250,
                child: CachedNetworkImage(
                  imageUrl:
                      '${BaseUrl.Get()}/imageProvider/characters/titan.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 25),
              EquipmentWidget(),
            ],
          ),
          const MyDivider(),
          const StatsWidget(),
          const MyDivider(),
        ],
      ),
    );
  }
}

class TabModifiersWidget extends StatelessWidget {
  const TabModifiersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EquipmentBloc>(context).add(GetEquipmentEvent());

    return SingleChildScrollView(
      child: Column(
        children: [
          Text('123'),
          Text('123'),
          Text('123'),
          Text('123'),
          Text('123'),
          Text('123'),
        ],
      ),
    );
  }
}
