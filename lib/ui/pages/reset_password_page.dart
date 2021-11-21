import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Reset Password'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              Text('Registered Email: ${widget.email}'),
              const SizedBox(height: 20),
              // password field
              TextFormField(
                decoration: const InputDecoration(hintText: 'New Password'),
              ),
              const SizedBox(height: 40),
              // reset password button
              TextButton(
                onPressed: _onResetPasswordPressed,
                child: const Text(
                  'Reset Password',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onResetPasswordPressed() {
    AutoRouter.of(context).pop();
  }
}
