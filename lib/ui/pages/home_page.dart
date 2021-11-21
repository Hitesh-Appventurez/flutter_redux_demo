import 'package:auto_route/auto_route.dart';
import 'package:demo2/utils/app_router.gr.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Logged in as: $email'),
            const SizedBox(height: 40),
            // Logout button
            SizedBox(
              width: 200,
              child: TextButton(
                onPressed: () => _onLogoutPressed(context),
                child:
                    const Text('Logout', style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onLogoutPressed(BuildContext context) {
    AutoRouter.of(context).replaceAll([const LoginRoute()]);
  }
}
