import 'package:flutter/material.dart';
import 'login_logic.dart'; // Importing logic file
import 'login_widgets.dart'; // Importing reusable widgets
import 'social_login_buttons.dart';
import '../../newsfeed/newsfeed_screen.dart'; // Import the newsfeed screen

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                      'assets/PeerSignet_Color_RGB.png', // Make sure this image path is correct
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
                      const SizedBox(height: 200), // Add some space at the top
                      Center(
                        child: Container(
                          child: const Text(
                            'Welcome back!',
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(255, 250, 250, 1.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Almost like with any social media you can share the content you love, but with peer, you earn on the side – no fame needed!',
                        textAlign: TextAlign.center, // Center this text as well
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(255, 250, 250, 1.0),
                        ),
                      ),
                      const SizedBox(height: 40),
                      // Centering the buttons
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SocialLoginButtons(), // Reusable widget for social login buttons
                          const SizedBox(height: 30),

                          CustomTextField(hintText: 'Email'), // Email text field
                          const SizedBox(height: 20),
                          
                          CustomPasswordField(hintText: 'Password'), // Password text field
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
                      CustomLoginButton(
                        onPressed: () {
                          handleLogin(context); // Login logic
                          // Navigate to Newsfeed
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsFeedScreen(), // Replace this with your newsfeed screen widget
                            ),
                          );
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
            handleSignUp(context); // Sign up logic
          },
          child: Text(
            'Sign up',
            style: TextStyle(
              color: const Color.fromRGBO(168, 233, 255, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
