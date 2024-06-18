import 'package:client/services/handlers/buff_bar_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class BuffBarWidget extends ConsumerWidget {
  BuffBarWidget({super.key});
  final handler = GetIt.I<BuffBarHandler>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(
      ChangeNotifierProvider<BuffBarHandler>(
        (ref) => handler,
      ),
    );
    return SizedBox(
      child: Row(
        children: List.generate(
          provider.stateslist.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/spells/${provider.stateslist[index].imagePath}',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
