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

class LoadedInventoryState extends InventoryState {
  LoadedInventoryState({super.key, required this.items});
  final storage = GetIt.I<UserStorage>();
  final List<Item> items;

  Widget? getButtons(BuildContext context, int index) {
    if (items[index].canEquipped && !items[index].isEquipped) {
      return OutlinedButton(
        onPressed: () async {
          await EquipService().equipItem(DressingRequest(
              name: storage.character.name, id: items[index].id));
          _updateInventory(context);
        },
        child: const Text(
          'Надеть',
          style: TextStyle(fontSize: 12),
        ),
      );
    } else if (items[index].canEquipped && items[index].isEquipped) {
      return OutlinedButton(
        onPressed: () async {
          await EquipService().unEquipItem(
            DressingRequest(name: storage.character.name, id: items[index].id),
          );
          _updateInventory(context);
        },
        child: const Text(
          'Снять',
          style: TextStyle(fontSize: 12),
        ),
      );
    } else {
      return null;
    }
  }

  _updateInventory(BuildContext context) {
    BlocProvider.of<InventoryBloc>(context).add(GetInventoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children: List.generate(
            items.length,
            (index) {
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Center(
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.black12,
                            child: CachedNetworkImage(
                              imageUrl:
                                  '${BaseUrl.Get()}/imageProvider/${items[index].imagePath}',
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                items[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Text(
                              items[index].description,
                              style: const TextStyle(fontSize: 12),
                              softWrap: true,
                            ),
                            const SizedBox(height: 3),
                            Text(
                              items[index].gainsDescription,
                              style: const TextStyle(fontSize: 13),
                              softWrap: true,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (getButtons(context, index) != null)
                          getButtons(context, index)!,
                        const SizedBox(width: 10),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: OutlinedButton(
                            onPressed: () async {
                              await EquipService().destroyItem(DressingRequest(
                                  name: storage.character.name,
                                  id: items[index].id));
                              _updateInventory(context);
                            },
                            child: const Text('Выбросить',
                                style: TextStyle(fontSize: 12)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
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
