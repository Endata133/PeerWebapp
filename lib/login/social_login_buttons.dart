import 'package:flutter/material.dart';

class SocialLoginButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildSocialButton(Icons.android),
        SizedBox(width: 20),
        _buildSocialButton(Icons.apple),
        SizedBox(width: 20),
        _buildSocialButton(Icons.facebook),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[850],
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: () {
          // Social login action
        },
      ),
    );
  }
}
