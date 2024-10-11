import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        backgroundColor: Colors.grey[850],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reset your password',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Enter your email address, and we’ll send you a link to reset your password.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[500],
                ),
              ),
              SizedBox(height: 40),
              _buildEmailField(),
              SizedBox(height: 30),
              _buildSendResetLinkButton(),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  // Email input field
  Widget _buildEmailField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Email',
        filled: true,
        fillColor: Colors.grey[850],
        hintStyle: TextStyle(color: Colors.grey[500]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  // Reset button
  Widget _buildSendResetLinkButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Add password reset functionality
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.blue[400],
        ),
        child: Text('Send Reset Link'),
      ),
    );
  }
}
