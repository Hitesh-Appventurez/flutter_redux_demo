import 'package:demo2/redux/actions/_app_action.dart';

class LoginProgressAction implements AppAction {}

class LoginSuccessAction implements AppAction {}

class LoginFailedAction implements AppAction {
  final String errorMessage;

  LoginFailedAction({this.errorMessage = ''});
}

class ResetLoginStateAction implements AppAction {}
