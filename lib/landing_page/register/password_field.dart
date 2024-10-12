// password_field.dart
import 'package:flutter/material.dart';

class CustomPasswordField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isVisible;
  final Function(bool) onVisibilityChanged;

  const CustomPasswordField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.isVisible,
    required this.onVisibilityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: !isVisible,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[850],
        hintStyle: TextStyle(color: Colors.grey[500]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey[500],
          ),
          onPressed: () => onVisibilityChanged(!isVisible),
        ),
      ),
      style: TextStyle(color: Color.fromRGBO(255, 250, 250, 1.0)),
    );
  }
}
