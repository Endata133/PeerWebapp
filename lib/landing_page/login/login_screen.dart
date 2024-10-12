import 'package:flutter/material.dart';
import 'login_logic.dart'; // Importing logic file
import 'login_widgets.dart'; // Importing reusable widgets
import 'social_login_buttons.dart';
import '../../newsfeed/newsfeed_screen.dart'; // Import the newsfeed screen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  // Handles login button press
  Future<void> _handleLogin(BuildContext context) async {
    setState(() {
      _isLoading = true; // Show loading indicator while logging in
    });

    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showSnackBar(context, 'Please enter both email and password');
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final loginLogic = LoginLogic();
    bool success = await loginLogic.handleLogin(email, password);

    setState(() {
      _isLoading = false;
    });

    if (success) {
      // Navigate to Newsfeed on successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NewsFeedScreen()),
      );
    } else {
      _showSnackBar(context, 'Login failed. Please check your credentials.');
    }
  }

  // Helper function to show snackbars
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(70)),
              child: Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Image.asset(
                      'assets/PeerSignet_Color_RGB.png', // Ensure this image path is correct
                      width: 150,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
                    children: [
                      const SizedBox(height: 200), // Add space at the top
                      const Text(
                        'Welcome back!',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(255, 250, 250, 1.0),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Almost like with any social media you can share the content you love, but with peer, you earn on the side – no fame needed!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(255, 250, 250, 1.0),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SocialLoginButtons(), // Social login buttons
                          const SizedBox(height: 30),
                          CustomTextField(
                            hintText: 'Email',
                            controller: _emailController, // Email controller
                          ),
                          const SizedBox(height: 20),
                          CustomPasswordField(
                            hintText: 'Password',
                            controller: _passwordController, // Password controller
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            handleForgotPassword(context); // Forgot password logic
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 250, 250, 1.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      _isLoading
                          ? CircularProgressIndicator() // Show loading indicator when logging in
                          : CustomLoginButton(
                              onPressed: () {
                                _handleLogin(context); // Login logic
                              },
                            ),
                      const SizedBox(height: 20),
                      _buildSignUpText(context),
                    ],
                  ),
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
          style: TextStyle(color: Color.fromRGBO(255, 250, 250, 1.0)),
        ),
        GestureDetector(
          onTap: () {
            handleSignUp(context); // Sign-up logic
          },
          child: const Text(
            'Sign up',
            style: TextStyle(
              color: Color.fromRGBO(168, 233, 255, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
