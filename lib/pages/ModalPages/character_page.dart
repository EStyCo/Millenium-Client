import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/bloc/equipment/equipment_bloc.dart';
import 'package:client/bloc/equipment/equipment_event.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/widgets/appbars/default_appbar.dart';
import 'package:client/widgets/divider_widget.dart';
import 'package:client/widgets/equipment_widget.dart';
import 'package:client/widgets/stats_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterModalPage extends StatelessWidget {
  const CharacterModalPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EquipmentBloc>(context).add(GetEquipmentEvent());

    return Scaffold(
      appBar: const DefaultAppBar(),
      body: SingleChildScrollView(
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
                const SizedBox(
                  width: 25,
                ),
                EquipmentWidget()
              ],
            ),
            const MyDivider(),
            const StatsWidget(),
            const MyDivider(),
          ],
        ),
      ),
    );
  }
}
