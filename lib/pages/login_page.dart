import 'package:client/bloc/login/login_bloc.dart';
import 'package:client/bloc/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return state;
        },
      ),
    );
  }
}
