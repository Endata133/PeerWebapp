import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _pushNotifications = true;
  bool _emailNotifications = false;
  bool _isDarkTheme = false;

  // Function to handle logout
  void _logout() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('You have been logged out')),
    );
    // Add logic for logging out, such as clearing user data and navigating to the login screen.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Account Settings
            _buildSectionTitle('Account Settings'),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Change Email'),
              onTap: () {
                // Handle changing email
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Change Email tapped')),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Change Password'),
              onTap: () {
                // Handle changing password
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Change Password tapped')),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Manage Personal Information'),
              onTap: () {
                // Handle personal information management
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Manage Personal Information tapped')),
                );
              },
            ),

            SizedBox(height: 20),

            // Notification Settings
            _buildSectionTitle('Notification Settings'),
            SwitchListTile(
              title: Text('Push Notifications'),
              value: _pushNotifications,
              onChanged: (bool value) {
                setState(() {
                  _pushNotifications = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Email Notifications'),
              value: _emailNotifications,
              onChanged: (bool value) {
                setState(() {
                  _emailNotifications = value;
                });
              },
            ),

            SizedBox(height: 20),

            // Privacy Settings
            _buildSectionTitle('Privacy Settings'),
            ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text('Who can see my profile'),
              onTap: () {
                // Handle privacy settings for profile visibility
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Privacy setting for profile tapped')),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text('Who can see my posts'),
              onTap: () {
                // Handle privacy settings for post visibility
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Privacy setting for posts tapped')),
                );
              },
            ),

            SizedBox(height: 20),

            // Theme Settings
            _buildSectionTitle('Theme Settings'),
            SwitchListTile(
              title: Text('Dark Theme'),
              value: _isDarkTheme,
              onChanged: (bool value) {
                setState(() {
                  _isDarkTheme = value;
                  // Implement logic for changing theme if needed
                });
              },
            ),

            SizedBox(height: 20),

            // Logout Button
            ElevatedButton.icon(
              onPressed: _logout,
              icon: Icon(Icons.logout),
              label: Text('Logout'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
