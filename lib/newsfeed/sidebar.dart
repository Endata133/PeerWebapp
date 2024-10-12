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
              // Navigate to Home screen
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.play_circle_outline_sharp),
            title: Text('Posten'),
            onTap: () {
              // Navigate to Posting screen
              Navigator.push(context, MaterialPageRoute(builder: (context) => PostingScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              // Navigate to Profile screen
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Chats'),
            onTap: () {
              // Navigate to Chats screen
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Gruppen'),
            onTap: () {
              // Navigate to Gruppen screen
              Navigator.push(context, MaterialPageRoute(builder: (context) => GruppenScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Wallet'),
            onTap: () {
              // Navigate to Wallet screen
              Navigator.push(context, MaterialPageRoute(builder: (context) => WalletScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Shop'),
            onTap: () {
              // Navigate to Shop screen
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShopScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.campaign),
            title: Text('Advertiser'),
            onTap: () {
              // Navigate to Advertiser screen
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdvertiserScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Navigate to Settings screen
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
          ),
        ],
      ),
    );
  }
}
