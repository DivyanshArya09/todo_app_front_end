import 'package:flutter/material.dart';
import 'package:todo_app_front_end/features/authentication/presentation/pages/login_page.dart';
import 'package:todo_app_front_end/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:todo_app_front_end/features/home/presentation/pages/home_page.dart';
import 'package:todo_app_front_end/routes/app_routes.dart';

final kNavigatorKey = GlobalKey<NavigatorState>();

class CustomNavigator {
  static Route<dynamic> controller(RouteSettings settings) {
    switch (settings.name) {
      case AppPages.login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case AppPages.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpPage(),
        );
      case AppPages.home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      default:
        throw ('This route name does not exit');
    }
  }

  // Pushes to the route specified
  static Future<T?> pushTo<T extends Object?>(
    BuildContext context,
    String strPageName, {
    Object? arguments,
  }) async {
    return await Navigator.of(context, rootNavigator: true)
        .pushNamed(strPageName, arguments: arguments);
  }

  // Pop the top view
  static void pop(BuildContext context, {Object? result}) {
    Navigator.pop(context, result);
  }

  // Pops to a particular view
  static Future<T?> popTo<T extends Object?>(
    BuildContext context,
    String strPageName, {
    Object? arguments,
  }) async {
    return await Navigator.popAndPushNamed(
      context,
      strPageName,
      arguments: arguments,
    );
  }

  static void popUntilFirst(BuildContext context) {
    Navigator.popUntil(context, (page) => page.isFirst);
  }

  static void popUntilRoute(BuildContext context, String route, {var result}) {
    Navigator.popUntil(context, (page) {
      if (page.settings.name == route && page.settings.arguments != null) {
        (page.settings.arguments as Map<String, dynamic>)["result"] = result;
        return true;
      }
      return false;
    });
  }

  static Future<T?> pushReplace<T extends Object?>(
    BuildContext context,
    String strPageName, {
    Object? arguments,
  }) async {
    return await Navigator.pushReplacementNamed(
      context,
      strPageName,
      arguments: arguments,
    );
  }
}
