import 'package:flutter/material.dart';

// Custom Text Field Widget with Controller
class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller; // Added controller for managing input

  const CustomTextField({
    required this.hintText,
    required this.controller, // Required controller parameter
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, // Use the controller to handle text input
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
}

// Custom Password Field Widget with Controller
class CustomPasswordField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller; // Added controller for managing password input

  const CustomPasswordField({
    required this.hintText,
    required this.controller, // Required controller parameter
    super.key,
  });

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true; // Track if the text is obscured

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller, // Use the controller to manage password input
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: Colors.grey[850],
        hintStyle: TextStyle(color: Colors.grey[500]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey[500],
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText; // Toggle visibility of password
            });
          },
        ),
      ),
      obscureText: _obscureText, // Obscure text based on the state
      style: const TextStyle(color: Colors.white),
    );
  }
}

// Custom Login Button Widget
class CustomLoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomLoginButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
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
}
