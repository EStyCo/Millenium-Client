import 'package:client/services/local/user_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class HealthBarWidget extends ConsumerWidget {
  HealthBarWidget({super.key});
  final characterHUD = GetIt.I<HealthBarHandler>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    characterHUD.connectHub(context);

    final characterHealthBarWidget =
        ref.watch(characterHUD.characterHUDProvider);
    final currentHP = characterHealthBarWidget.currentHP;
    final currentMP = characterHealthBarWidget.currentMP;
    final maxHP = characterHealthBarWidget.maxHP;
    final maxMP = characterHealthBarWidget.maxMP;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/modalChar');
          },
          child: Row(children: [
            const Icon(Icons.heart_broken, color: Colors.red),
            const SizedBox(width: 5),
            Text(
              '$currentHP/$maxHP',
              style: const TextStyle(color: Colors.black),
            ),
          ]),
        ),
        // const SizedBox(
        //   width: 80,
        // ),
        // Row(
        //   children: [
        //     ElevatedButton(
        //       onPressed: () {},
        //       child: Row(
        //         children: [
        //           const Icon(Icons.bolt_outlined, color: Colors.lightBlue),
        //           const SizedBox(width: 5),
        //           Text(
        //             '$currentMP/$maxMP',
        //             style: const TextStyle(color: Colors.black),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        // ElevatedButton(
        //   onPressed: () {
        //     Navigator.pushNamed(context, '/modalInv');
        //   },
        //   child: const Icon(Icons.inventory),
        // )
      ],
    );
  }
}
