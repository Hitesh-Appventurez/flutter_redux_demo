import 'package:auto_route/auto_route.dart';
import 'package:demo2/utils/app_routes.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => _init());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Splash')),
    );
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 2));
    AutoRouter.of(context).replaceNamed(AppRoutes.loginPage);
  }
}
