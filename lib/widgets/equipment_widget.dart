import 'package:flutter/material.dart';

class Equipment extends StatefulWidget {
  const Equipment({super.key});

  @override
  State<Equipment> createState() => _EquipmentState();
}

class _EquipmentState extends State<Equipment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.headset)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.feed)),
          ],
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.handshake)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.shield)),
          ],
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.boy_rounded)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.food_bank_outlined)),
          ],
        ),
      ],
    );
  }
}
