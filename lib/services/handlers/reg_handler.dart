import 'package:client/models/LoginPage/AuthRequest/reg_request.dart';
import 'package:client/services/web/auth_service.dart';
import 'package:flutter/material.dart';

class RegHandler extends ChangeNotifier {
  RegHandler() {
    nameController.addListener(_updateText);
    emailController.addListener(_updateText);
    passwordController.addListener(_updateText);
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String name = '';
  String email = '';
  String password = '';
  String message = '';
  bool isloading = false;

  void registration() async {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      message = 'Заполните все поля!';
      notifyListeners();
      return;
    }

    try {
      final response = await AuthService().registerAsync(
          RegRequest(name: name, email: email, password: password));

      if (response.isSuccess) {
        message = 'Пользователь успешно добавлен';
        notifyListeners();
      } else {
        throw Exception(response);
      }
      nameController.removeListener(_updateText);
      emailController.removeListener(_updateText);
      passwordController.removeListener(_updateText);
    } catch (_) {
      message = 'Ошибка! \nРегистрация этого пользователя невозможна.';
    }
    isloading = false;
    notifyListeners();
  }

  void _updateText() {
    name = nameController.text;
    email = emailController.text;
    password = passwordController.text;
    notifyListeners();
  }
}
