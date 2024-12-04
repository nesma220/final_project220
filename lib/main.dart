import 'package:final_project/ui/screens/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Screens
import 'package:final_project/ui/screens/create_account_screen.dart';
import 'package:final_project/ui/screens/login_screen_ready.dart';
import 'package:final_project/ui/screens/profile_screen.dart';
import 'package:final_project/ui/screens/signIn.dart';
import 'package:final_project/ui/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FillProfileScreen(),
      // home: CreateAccountScreen(), //   تشغيل Splash Screen
      // getPages: [
      //   GetPage(
      //     name: "/create_account_screen",
      //     page: () => CreateAccountScreen(),
      //   ),
      //   GetPage(
      //     name: "/login_ready_screen",
      //     page: () => const LoginScreenReady(),
      //   ),
      //   GetPage(
      //     name: "/signin_screen",
      //     page: () => SignInScreen(),
      //   ),
      //   GetPage(
      //     name: "/profile_screen",
      //     page: () => const FillProfileScreen(),
      //   ),
      // ],
    );
  }
}
