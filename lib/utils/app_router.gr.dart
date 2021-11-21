// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../ui/pages/forgot_password_page.dart' as _i4;
import '../ui/pages/home_page.dart' as _i6;
import '../ui/pages/login_page.dart' as _i2;
import '../ui/pages/reset_password_page.dart' as _i5;
import '../ui/pages/signup_page.dart' as _i3;
import '../ui/pages/splash_page.dart' as _i1;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    LoginRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    SignupRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SignupPage());
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ForgotPasswordPage());
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.ResetPasswordPage(key: args.key, email: args.email));
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.HomePage(key: args.key, email: args.email));
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(SplashRoute.name, path: '/'),
        _i7.RouteConfig(LoginRoute.name, path: '/login_page'),
        _i7.RouteConfig(SignupRoute.name, path: '/signup_page'),
        _i7.RouteConfig(ForgotPasswordRoute.name,
            path: '/forgot_password_page'),
        _i7.RouteConfig(ResetPasswordRoute.name, path: '/reset_password_page'),
        _i7.RouteConfig(HomeRoute.name, path: '/home_page')
      ];
}

/// generated route for [_i1.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for [_i2.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute() : super(name, path: '/login_page');

  static const String name = 'LoginRoute';
}

/// generated route for [_i3.SignupPage]
class SignupRoute extends _i7.PageRouteInfo<void> {
  const SignupRoute() : super(name, path: '/signup_page');

  static const String name = 'SignupRoute';
}

/// generated route for [_i4.ForgotPasswordPage]
class ForgotPasswordRoute extends _i7.PageRouteInfo<void> {
  const ForgotPasswordRoute() : super(name, path: '/forgot_password_page');

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for [_i5.ResetPasswordPage]
class ResetPasswordRoute extends _i7.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({_i8.Key? key, required String email})
      : super(name,
            path: '/reset_password_page',
            args: ResetPasswordRouteArgs(key: key, email: email));

  static const String name = 'ResetPasswordRoute';
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({this.key, required this.email});

  final _i8.Key? key;

  final String email;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for [_i6.HomePage]
class HomeRoute extends _i7.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i8.Key? key, required String email})
      : super(name,
            path: '/home_page', args: HomeRouteArgs(key: key, email: email));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, required this.email});

  final _i8.Key? key;

  final String email;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, email: $email}';
  }
}
