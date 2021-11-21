import 'package:demo2/redux/actions/auth_actions.dart';
import 'package:demo2/redux/states/_app_state.dart';
import 'package:demo2/redux/states/auth_states.dart';

/// Reducer receives the action, knows previous state and can return new state.
/// It must be a pure function, whose only task is to return state and no side-effects like network calls, etc.
/// Do not mutate previous state object, rather create a new one.
/// Return old state, in case an unknown action is received.
AppState appReducer(AppState prevState, dynamic action) {
  // action to show login processing
  if (action is LoginProgressAction) {
    return AppState(loginState: LoginProgressState());
  }
  // to perform task on login success
  else if (action is LoginSuccessAction) {
    return AppState(loginState: LoginSuccessState());
  }
  // to perform task on login failed
  else if (action is LoginFailedAction) {
    return AppState(
      loginState: LoginFailedState(errorMessage: action.errorMessage),
    );
  }
  // to reset login state to initial so that callbacks are called more than once.
  else if (action is ResetLoginStateAction) {
    return AppState(loginState: LoginInitialState());
  }

  return prevState;
}
