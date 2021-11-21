import 'package:auto_route/auto_route.dart';
import 'package:demo2/redux/actions/auth_actions.dart';
import 'package:demo2/redux/middlewares/auth_middleware.dart';
import 'package:demo2/redux/states/_app_state.dart';
import 'package:demo2/redux/states/auth_states.dart';
import 'package:demo2/utils/app_router.gr.dart';
import 'package:demo2/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _authMiddleware = AuthMiddleware();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: false,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // email field
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                  validator: (val) =>
                      (val?.trim().isEmpty ?? true) ? 'Required' : null,
                ),
                const SizedBox(height: 20),
                // password field
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(hintText: 'Password'),
                  validator: (val) =>
                      (val?.trim().isEmpty ?? true) ? 'Required' : null,
                ),
                // forgot password button
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _onForgotPasswordPressed,
                    child: const Text('Forgot Password?'),
                  ),
                ),
                const SizedBox(height: 40),
                // login button
                _loginButton(),
                const SizedBox(height: 40),
                // signup button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: _onSignupPressed,
                      child: const Text('Create Account'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return StoreBuilder<AppState>(builder: (context, store) {
      _callbacks(store);

      if (store.state.loginState is LoginProgressState) {
        return const CircularProgressIndicator();
      }
      return SizedBox(
        width: 200,
        child: TextButton(
          onPressed: () => _onLoginPressed(store),
          child: const Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
        ),
      );
    });
  }

  void _onLoginPressed(Store<AppState> store) {
    if (_formKey.currentState?.validate() ?? false) {
      store.dispatch(_authMiddleware.login(
        _emailController.text.trim(),
        _passwordController.text,
      ));
    }
  }

  void _onForgotPasswordPressed() {
    AutoRouter.of(context).pushNamed(AppRoutes.forgotPasswordPage);
  }

  void _onSignupPressed() {
    AutoRouter.of(context).pushNamed(AppRoutes.signupPage);
  }

  void _callbacks(Store<AppState> store) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      bool called = false;

      if (store.state.loginState is LoginSuccessState) {
        // AutoRouter.of(context).replaceNamed(AppRoutes.homePage); // throws exception
        AutoRouter.of(context).replace(HomeRoute(email: _emailController.text));
        called = true;
      } else if (store.state.loginState is LoginFailedState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              (store.state.loginState as LoginFailedState).errorMessage,
            ),
          ),
        );
        called = true;
      }

      /// reset login state to initial, so that callbacks are called more than once.
      if (called) {
        store.dispatch(ResetLoginStateAction());
      }
    });
  }
}
