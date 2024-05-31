import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_front_end/core/themes/app_themes.dart';
import 'package:todo_app_front_end/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:todo_app_front_end/routes/app_routes.dart';
import 'package:todo_app_front_end/routes/customNavigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        375.0,
        812,
      ),
      builder: (context, child) => MaterialApp(
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: AppTheme.lightTheme,
        initialRoute: AppPages.appEntry,
        onGenerateRoute: CustomNavigator.controller,
        home: const SignUpPage(),
      ),
    );
  }
}
