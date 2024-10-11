import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'forgot_password_screen.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(), // Initial screen is the LoginScreen
      routes: {
        '/register': (context) => RegisterScreen(), // Route for the RegisterScreen
        '/forgot-password': (context) => ForgotPasswordScreen(), // Route for ForgotPasswordScreen
      },
    );
  }
}
