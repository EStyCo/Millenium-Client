import 'package:client/bloc/login/login_bloc.dart';
import 'package:client/bloc/login/login_event.dart';
import 'package:client/models/LoginPage/LoginRequest/login_request.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/switch_platform_widget.dart';

abstract class LoginState extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginState({super.key});
}

// ignore: must_be_immutable
class InitialLoginState extends LoginState {
  String message;
  InitialLoginState({super.key, String? error}) : message = error ?? '';

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    BaseUrl.switchToLocal();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'email',
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'password',
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                String email = emailController.text;
                String password = passwordController.text;
                if (email.isEmpty && password.isEmpty) {
                  email = 1.toString();
                  password = 1.toString();
                }
                loginBloc.add(LoginEvent(
                  loginRequest: LoginRequest(email: email, password: password),
                ));
              },
              child: const Text("Login"),
            ),
            const SwitchPlatformWidget()
          ],
        ),
      ),
    );
  }
}

class LoadingLoginState extends LoginState {
  LoadingLoginState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

class SucceedLoginState extends LoginState {
  SucceedLoginState({super.key});

  @override
  Widget build(BuildContext context) {
    Future(() => Navigator.pushReplacementNamed(context, '/main'));
    return const Scaffold();
  }
}

class DeniedLoginState extends LoginState {
  DeniedLoginState({super.key});

  @override
  Widget build(BuildContext context) {
    return InitialLoginState(error: "Нет доступа!");
  }
}