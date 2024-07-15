
import 'package:client/bloc/inventory/inventory_bloc.dart';
import 'package:client/bloc/inventory/inventory_state.dart';
import 'package:client/widgets/appbars/inventory_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InventoryModalPage extends StatelessWidget {
  const InventoryModalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const InventoryAppBar(),
      body: BlocBuilder<InventoryBloc, InventoryState>(
        builder: (context, state) {
          return state;
        },
      ),
    );
  }
}
