import 'package:flutter/material.dart';
import 'splash_screen.dart'; // استيراد صفحة SplashScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // تشغيل Splash Screen
    );
  }
}
