import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/services/handlers/auth_handler.dart';
import 'package:client/widgets/switch_platform_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AuthPage extends ConsumerWidget {
  AuthPage({super.key}) {
    GetIt.I<AuthHandler>().checkVersion();
  }

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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              'Millenium',
              style: TextStyle(fontSize: 25),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Align(
                  alignment: Alignment.center,
                  heightFactor: 250 / (400),
                  child: CachedNetworkImage(
                  imageUrl:
                      '${BaseUrl.Get()}/imageProvider/home/millennium.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          ),
          if (provider.isCorrectVersion)
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: Column(
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
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/modalReg'),
                    child: const Text('регистрация'),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'v.${provider.buildVersion}',
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),
            )
          else
            SizedBox(
              height: 250,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Не корректная версия приложения!\nСкачайте новую версию',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => provider.downloadNewVersion(),
                      child: const Text('Перейти'),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
