import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle Home Tap
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              // Handle Profile Tap
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Chats'),
            onTap: () {
              // Handle Chats Tap
            },
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Gruppen'),
            onTap: () {
              // Handle Gruppen Tap
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Wallet'),
            onTap: () {
              // Handle Wallet Tap
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Shop'),
            onTap: () {
              // Handle Shop Tap
            },
          ),
          ListTile(
            leading: Icon(Icons.campaign),
            title: Text('Advertiser'),
            onTap: () {
              // Handle Advertiser Tap
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Handle Settings Tap
            },
          ),
        ],
      ),
    );
  }
}
