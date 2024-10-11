import 'package:flutter/material.dart';
import 'social_login_buttons.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[300],
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
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
              child: SingleChildScrollView( // Added to handle vertical overflow
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome back!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(215, 255, 255, 255),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Almost like with any social media you can share the content you love, but with peer, you earn on the side – no fame needed!',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                    const SizedBox(height: 40),
                    SocialLoginButtons(), // Reusable widget for social login buttons
                    const SizedBox(height: 30),
                    _buildTextField('Email'),
                    const SizedBox(height: 20),
                    _buildPasswordField('Password'),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/forgot-password'); // Navigate to Forgot Password screen
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
                    _buildLoginButton(),
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

  // Input Field for Email and Password
  Widget _buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[850],
        hintStyle: TextStyle(color: Colors.grey[500]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildPasswordField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[850],
        hintStyle: TextStyle(color: Colors.grey[500]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        suffixIcon: Icon(Icons.visibility, color: Colors.grey[500]),
      ),
      obscureText: true,
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('Login'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.blue[400],
        ),
      ),
    );
  }

  Widget _buildSignUpText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/register'); // Navigate to the register screen
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
