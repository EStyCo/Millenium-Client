import 'package:client/bloc/stats/stats_bloc.dart';
import 'package:client/bloc/stats/stats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatsWidget extends StatelessWidget {
  const StatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => StatsBloc(),
      child: BlocBuilder<StatsBloc, StatsState>(
        builder: (context, state) {
          return state;
        },
      ),
    );
  }
}