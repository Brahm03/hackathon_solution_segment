part of 'login_bloc.dart';

enum LoginStatus {
  success,
  loading,
  initial,
  error,
}

class LoginState extends Equatable {
  final LoginStatus loginStatus;

  @override
  List<Object?> get props => [loginStatus];

  const LoginState({
    this.loginStatus = LoginStatus.initial,
  });
}
