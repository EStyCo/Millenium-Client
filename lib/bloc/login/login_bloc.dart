import 'package:client/bloc/login/login_event.dart';
import 'package:client/bloc/login/login_state.dart';
import 'package:client/models/LoginPage/Character/character.dart';
import 'package:client/services/web/auth_service.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LoginBloc extends Bloc<LoginPageEvent, LoginState> {
  var authService = AuthService();
  UserStorage storage = GetIt.I<UserStorage>();

  LoginBloc() : super(InitialLoginState()) {
    on<LoginEvent>((event, emit) async {
      emit(LoadingLoginState());
      try {
        final response = await authService.loginAsync(event.loginRequest);

        if (response.isSuccess) {
          final Character character =
              Character.fromJson(response.result?['character']);
          storage.character = character;
        } else {
          throw Exception();
        }

        emit(SucceedLoginState());
        await Future.delayed(const Duration(seconds: 5));
      } catch (_) {
        emit(DeniedLoginState());
      }
    });
  }
}
