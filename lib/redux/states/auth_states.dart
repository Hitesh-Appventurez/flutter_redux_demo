abstract class LoginState {}

class LoginInitialState implements LoginState {}

class LoginProgressState implements LoginState {}

class LoginSuccessState implements LoginState {}

class LoginFailedState implements LoginState {
  final String errorMessage;

  LoginFailedState({this.errorMessage = ''});
}
