import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/bloc/inventory/inventory_bloc.dart';
import 'package:client/bloc/inventory/inventory_event.dart';
import 'package:client/models/Request/dressing_request.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:client/models/item.dart';
import 'package:client/services/web/equip_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class InventoryState extends StatelessWidget {
  const InventoryState({super.key});
}

class LoadingInventoryState extends InventoryState {
  const LoadingInventoryState({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 50,
      height: 50,
      child: CircularProgressIndicator(),
    );
  }
}

// ignore: must_be_immutable
class LoadedInventoryState extends InventoryState {
  LoadedInventoryState({super.key, required this.items});
  final storage = GetIt.I<UserStorage>();
  List<Item> items;

  ElevatedButton? getButtons(BuildContext context, int index) {
    if (items[index].canEquipped && !items[index].isEquipped) {
      return ElevatedButton(
        onPressed: () async {
          await EquipService().equipItem(DressingRequest(
              name: storage.character.name, id: items[index].id));
          BlocProvider.of<InventoryBloc>(context).add(GetInventoryEvent());
        },
        child: const Text('Надеть'),
      );
    } else if (items[index].canEquipped && items[index].isEquipped) {
      return ElevatedButton(
        onPressed: () async {
          await EquipService().unEquipItem(
            DressingRequest(name: storage.character.name, id: items[index].id),
          );
          BlocProvider.of<InventoryBloc>(context).add(GetInventoryEvent());
        },
        child: const Text('Снять'),
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          items.length,
          (index) {
            return ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.black12,
                child: CachedNetworkImage(
                  imageUrl:
                      '${BaseUrl.Get()}/imageProvider/${items[index].imagePath}',
                ),
              ),
              title: Text('${items[index].name} [${items[index].id}]'),
              subtitle: Text(items[index].description),
              trailing: getButtons(context, index),
              dense: false,
            );
          },
        ),
      ),
    );
  }
}

class EmptyInventoryState extends InventoryState {
  const EmptyInventoryState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 10),
      child: const Text('Ваш инвентарь пуст'),
    );
  }
}
