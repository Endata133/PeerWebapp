import 'package:flutter/material.dart';
import '../login/login_screen.dart'; // Import your login screen

class NewsFeedAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Newsfeed'),
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            // Pop all routes and navigate to the login screen
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          tooltip: 'Log Out',
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
