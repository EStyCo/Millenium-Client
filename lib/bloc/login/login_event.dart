import 'package:client/models/LoginPage/LoginRequest/login_request.dart';

abstract class LoginPageEvent {}

class LoginEvent extends LoginPageEvent {
  LoginRequest loginRequest;

  LoginEvent({required this.loginRequest});
}

class RegEvent extends LoginPageEvent {}
