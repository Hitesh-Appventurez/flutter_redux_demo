import 'package:auto_route/auto_route.dart';
import 'package:demo2/ui/pages/forgot_password_page.dart';
import 'package:demo2/ui/pages/home_page.dart';
import 'package:demo2/ui/pages/login_page.dart';
import 'package:demo2/ui/pages/reset_password_page.dart';
import 'package:demo2/ui/pages/signup_page.dart';
import 'package:demo2/ui/pages/splash_page.dart';
import 'package:demo2/utils/app_routes.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route', // 'toReplace,replaceWith'
  routes: [
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: LoginPage, path: AppRoutes.loginPage),
    AutoRoute(page: SignupPage, path: AppRoutes.signupPage),
    AutoRoute(page: ForgotPasswordPage, path: AppRoutes.forgotPasswordPage),
    AutoRoute(page: ResetPasswordPage, path: AppRoutes.resetPasswordPage),
    AutoRoute(page: HomePage, path: AppRoutes.homePage),
  ],
)
class $AppRouter {}
