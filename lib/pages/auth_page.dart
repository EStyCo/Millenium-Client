import 'package:client/services/handlers/auth_handler.dart';
import 'package:client/widgets/switch_platform_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AuthPage extends ConsumerWidget {
  AuthPage({super.key});

  final handler = GetIt.I<AuthHandler>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(
      ChangeNotifierProvider<AuthHandler>(
        (ref) => handler,
      ),
    );

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 60, right: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(provider.message),
            TextField(
              controller: provider.emailController,
              decoration: const InputDecoration(
                labelText: 'email',
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: provider.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'password',
              ),
            ),
            const SizedBox(height: 25),
            if (provider.isloading)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: () {
                  provider.Login(context);
                },
                child: const Text("Login"),
              ),
            const SwitchPlatformWidget(),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/modalReg'),
              child: const Text('регистрация'),
            )
          ],
        ),
      ),
    );
  }
}
