import 'package:client/models/LoginPage/AuthRequest/login_request.dart';
import 'package:client/models/LoginPage/Character/character.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:client/services/web/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AuthHandler extends ChangeNotifier {
  AuthHandler() {
    emailController.addListener(_updateText);
    passwordController.addListener(_updateText);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late String message = '';
  late String email = '';
  late String password = '';
  bool isloading = false;

  final storage = GetIt.I<UserStorage>();

  void Login(BuildContext context) async {
    if (email == '' || password == '') {
      email = '1';
      password = '1';
    }

    isloading = true;
    notifyListeners();

    try {
      final response = await AuthService()
          .loginAsync(LoginRequest(email: email, password: password));

      if (response.isSuccess) {
        final Character character =
            Character.fromJson(response.result?['character']);
        storage.character = character;
      } else {
        throw Exception();
      }
      emailController.removeListener(_updateText);
      passwordController.removeListener(_updateText);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/main');
    } catch (_) {
      message = 'Нет доступа!';
    }
    isloading = false;
    notifyListeners();
  }

  void _updateText() {
    email = emailController.text;
    password = passwordController.text;
    notifyListeners();
  }
}
