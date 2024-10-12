// register_screen.dart
import 'package:flutter/material.dart';
import 'text_field.dart';
import 'password_field.dart';
import 'register_button.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final String registerMutation = """
    mutation Register(\$username: String!, \$email: String!, \$password: String!) {
      register(input: { email: \$email, password: \$password, username: \$username }) {
        errorMessage
        userid
        status
      }
    }
  """;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  bool _isSubmitting = false;
  String? _errorMessage;

  void _onRegisterSuccess(String userid) {
    // Handle successful registration (e.g., navigate to verification)
    print('Registered successfully with userid: $userid');
  }

  void _onRegisterFailure(String error) {
    setState(() {
      _errorMessage = error;
      _isSubmitting = false; // Stop submitting on failure
    });
  }

  void _onSubmit(bool submitting) {
    setState(() {
      _isSubmitting = submitting;
    });
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
                color: Colors.grey[300],
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      'assets/PeerSignet_Color_RGB.png',
                      width: 150,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get started!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 250, 250, 1.0),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Almost like any social media, share content you love and earn on the side – no fame needed!',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(255, 250, 250, 1.0),
                      ),
                    ),
                    SizedBox(height: 40),
                    CustomTextField(hintText: 'Username', controller: _usernameController),
                    SizedBox(height: 20),
                    CustomTextField(hintText: 'Email', controller: _emailController),
                    SizedBox(height: 20),
                    CustomPasswordField(
                      hintText: 'Password',
                      controller: _passwordController,
                      isVisible: _passwordVisible,
                      onVisibilityChanged: (value) {
                        setState(() {
                          _passwordVisible = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    CustomPasswordField(
                      hintText: 'Confirm Password',
                      controller: _confirmPasswordController,
                      isVisible: _confirmPasswordVisible,
                      onVisibilityChanged: (value) {
                        setState(() {
                          _confirmPasswordVisible = value;
                        });
                      },
                    ),
                    SizedBox(height: 30),
                    RegisterButton(
                      registerMutation: registerMutation,
                      usernameController: _usernameController,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      confirmPasswordController: _confirmPasswordController,
                      isSubmitting: _isSubmitting,
                      onSubmit: _onSubmit,
                      onRegisterSuccess: _onRegisterSuccess,
                      onRegisterFailure: _onRegisterFailure,
                    ),
                    SizedBox(height: 20),
                    if (_errorMessage != null)
                      Text(
                        _errorMessage!,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    SizedBox(height: 20),
                    _buildSignInText(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignInText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyle(color: Color.fromRGBO(255, 250, 250, 1.0)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'Sign in',
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
