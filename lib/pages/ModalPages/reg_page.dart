import 'package:client/widgets/default_appbar.dart';
import 'package:client/widgets/divider_widget.dart';
import 'package:client/widgets/equipment_widget.dart';
import 'package:client/widgets/stats_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../services/handlers/reg_handler.dart';

class RegModalPage extends ConsumerWidget {
  RegModalPage({super.key});

  final handler = GetIt.I<RegHandler>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(
      ChangeNotifierProvider<RegHandler>(
        (ref) => handler,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 214, 213, 213),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 60, right: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.message,
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: provider.nameController,
              decoration: const InputDecoration(
                labelText: 'name',
              ),
            ),
            TextField(
              controller: provider.emailController,
              decoration: const InputDecoration(
                labelText: 'email',
              ),
            ),
            TextField(
              controller: provider.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'password',
              ),
            ),
            const SizedBox(height: 50),
            if (provider.isloading)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: () => provider.registration(),
                child: const Text('Добавить Игрока'),
              )
          ],
        ),
      ),
    );
  }
}
