import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  TextEditingController loginController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  LoginBloc() : super(LoginState()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
