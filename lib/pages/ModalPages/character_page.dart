import 'package:client/widgets/default_appbar.dart';
import 'package:client/widgets/divider_widget.dart';
import 'package:client/widgets/equipment_widget.dart';
import 'package:client/widgets/stats_widget.dart';
import 'package:flutter/material.dart';

class CharacterModalPage extends StatelessWidget {
  CharacterModalPage({super.key});

  final String selectedValue = 'Option 1';
  final List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/warrior_image.jpg'),
              ),
            ),
            MyDivider(),
            StatsWidget(),
            MyDivider(),
            Equipment()
          ],
        ),
      ),
    );
  }
}
