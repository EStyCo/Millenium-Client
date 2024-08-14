import 'package:client/bloc/equipment/equipment_bloc.dart';
import 'package:client/bloc/equipment/equipment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EquipmentWidget extends StatelessWidget {
  const EquipmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<EquipmentBloc, EquipmentState>(
      builder: (context, state) {
        return state;
      },
    );
  }
}
