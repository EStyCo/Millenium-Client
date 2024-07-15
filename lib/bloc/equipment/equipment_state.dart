import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/models/Response/equipment_response.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/models/item.dart';
import 'package:flutter/material.dart';

abstract class EquipmentState extends StatelessWidget {
  const EquipmentState({super.key});
}

class LoadedEquipmentState extends EquipmentState {
  const LoadedEquipmentState({super.key, required this.equip});
  final EquipmentResponse equip;

  CachedNetworkImage _getImage(Item? item) {
    if (item == null) {
      return CachedNetworkImage(
          imageUrl: '${BaseUrl.Get()}/imageProvider/items/empty_slot.png');
    } else {
      return CachedNetworkImage(
          imageUrl: '${BaseUrl.Get()}/imageProvider/${item.imagePath}');
    }
  }

  void _getDetails(BuildContext context, Item? item) {
    if (item == null) return;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CachedNetworkImage(
                    imageUrl:
                        '${BaseUrl.Get()}/imageProvider/${item.imagePath}'),
                const SizedBox(height: 10),
                Text(
                  '${item.name} [${item.id}]',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(item.description)
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: InkWell(
                onTap: () => _getDetails(context, equip.head),
                child: _getImage(equip.head),
              ),
            ),
            SizedBox(
              width: 60,
              height: 60,
              child: InkWell(
                onTap: () => _getDetails(context, equip.body),
                child: _getImage(equip.body),
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: InkWell(
                onTap: () => _getDetails(context, equip.weapon),
                child: _getImage(equip.weapon),
              ),
            ),
            SizedBox(
              width: 60,
              height: 60,
              child: InkWell(
                child: _getImage(null),
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: InkWell(
                child: _getImage(null),
              ),
            ),
            SizedBox(
              width: 60,
              height: 60,
              child: InkWell(
                child: _getImage(null),
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: InkWell(
                child: _getImage(equip.feet),
              ),
            ),
            SizedBox(
              width: 60,
              height: 60,
              child: InkWell(
                child: _getImage(null),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class EmptyEquipmentState extends EquipmentState {
  const EmptyEquipmentState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Text('Загрузка..'),
        )
      ],
    );
  }
}
