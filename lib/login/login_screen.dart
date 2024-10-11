import 'package:flutter/material.dart';
import 'login_logic.dart'; // Importing logic file
import 'login_widgets.dart'; // Importing reusable widgets
import 'social_login_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Image.asset(
                    'assets/PeerSignet_Color_RGB.png', // Make sure this image path is correct
                    width: 150,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        child: const Text(
                          'Welcome back!',
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(214, 9, 2, 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Almost like with any social media you can share the content you love, but with peer, you earn on the side – no fame needed!',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 15, 10, 10),
                      ),
                    ),
                    const SizedBox(height: 40),
                    SocialLoginButtons(), // Reusable widget for social login buttons
                    const SizedBox(height: 30),
                    CustomTextField(hintText: 'Email'), // Moved to login_widgets.dart
                    const SizedBox(height: 20),
                    CustomPasswordField(hintText: 'Password'), // Moved to login_widgets.dart
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          handleForgotPassword(context); // Moved to logic
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.blue[300],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomLoginButton(onPressed: handleLogin), // Login logic moved to login_logic.dart
                    const SizedBox(height: 20),
                    _buildSignUpText(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            handleSignUp(context); // Logic moved to login_logic.dart
          },
          child: Text(
            'Sign up',
            style: TextStyle(
              color: Colors.blue[300],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
