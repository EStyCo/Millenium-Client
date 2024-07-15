import 'package:client/bloc/equipment/equipment_bloc.dart';
import 'package:client/bloc/equipment/equipment_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InventoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const InventoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<EquipmentBloc>(context).add(GetEquipmentEvent());
        return true;
      },
      child: AppBar(
        title: const Text('Инвентарь'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 214, 213, 213),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
