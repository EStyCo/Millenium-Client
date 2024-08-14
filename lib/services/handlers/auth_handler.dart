import 'package:client/models/LoginPage/AuthRequest/login_request.dart';
import 'package:client/models/LoginPage/Character/character.dart';
import 'package:client/models/Response/api_response.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:client/services/web/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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
  bool isCorrectVersion = true;

  late String buildVersion = '';

  final storage = GetIt.I<UserStorage>();

  void Login(BuildContext context) async {
    await getAppVersion();
    if (!isCorrectVersion) {
      notifyListeners();
      return;
    }

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
            Character.fromJson(response.result!);
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

  void checkVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    buildVersion = packageInfo.version;
    notifyListeners();
  }

  Future getAppVersion() async {
    APIResponse response = await AuthService().checkVersion();
    var checkedVersion = response.result!['version'] as String;
    if (checkedVersion != buildVersion) isCorrectVersion = false;

    notifyListeners();
  }

  void downloadNewVersion() async {
    final Uri toLaunch =
        Uri(scheme: 'https', host: 't.me', path: 'millenium_game/3');
    await launchUrl(
      toLaunch,
      mode: LaunchMode.externalApplication,
    );
  }
}
