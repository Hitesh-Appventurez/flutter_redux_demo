import 'package:demo2/redux/actions/auth_actions.dart';
import 'package:demo2/redux/states/_app_state.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';

class AuthMiddleware {
  static AuthMiddleware? _instance;

  AuthMiddleware._internal();

  factory AuthMiddleware() {
    return _instance ??= AuthMiddleware._internal();
  }

  /// to perform login operation
  ThunkAction<AppState> login(String email, String password) {
    return (Store<AppState> store) async {
      store.dispatch(LoginProgressAction());

      // placeholder for network call
      await Future.delayed(const Duration(seconds: 5));

      if (email == 'test@test.com' && password == 'test') {
        store.dispatch(LoginSuccessAction());
      } else {
        store.dispatch(LoginFailedAction(errorMessage: 'Invalid credentials'));
      }
    };
  }
}
