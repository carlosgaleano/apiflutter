/**
 * @Author: Carlos Galeano
 * @Date:   2025-03-25 16:23:00
 * @Last Modified by:   Carlos Galeano
 * @Last Modified time: 2025-03-25 16:33:47
 */
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      home: LoginScreen(),
    );
  }
}
