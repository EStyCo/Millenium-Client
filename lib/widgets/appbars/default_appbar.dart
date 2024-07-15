import 'package:client/bloc/inventory/inventory_bloc.dart';
import 'package:client/bloc/inventory/inventory_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
              BlocProvider.of<InventoryBloc>(context).add(GetInventoryEvent());
            },
            icon: const Icon(Icons.inventory_2_outlined),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
