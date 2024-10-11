import 'package:flutter/material.dart';

// Handles login button press
void handleLogin() {
  // Implement your login logic here
  print('Login button pressed');
}

// Handles forgot password navigation
void handleForgotPassword(BuildContext context) {
  Navigator.pushNamed(context, '/forgot-password'); // Navigate to Forgot Password screen
}

// Handles sign-up button press
void handleSignUp(BuildContext context) {
  Navigator.pushNamed(context, '/register'); // Navigate to the register screen
}
