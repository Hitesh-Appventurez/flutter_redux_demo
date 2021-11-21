import 'package:demo2/redux/states/auth_states.dart';

/// a single class that encapsulates whole application data
class AppState {
  final LoginState loginState;

  AppState({required this.loginState});

  factory AppState.initial() => AppState(loginState: LoginInitialState());
}
