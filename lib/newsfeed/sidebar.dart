import 'package:flutter/material.dart';
import 'package:flutter_application_1/Posten/posting_screen.dart';
import 'package:flutter_application_1/advertiser/advertiser_screen.dart';
import 'package:flutter_application_1/gruppen/gruppen_screen.dart';
import 'package:flutter_application_1/homescreen/home_screen.dart';
import 'package:flutter_application_1/profile/profil_screen.dart';
import 'package:flutter_application_1/chats/chats_screen.dart';
import 'package:flutter_application_1/settings/setting_screen.dart';
import 'package:flutter_application_1/shop/shop_screen.dart';
import 'package:flutter_application_1/wallet/wallet_screen.dart';
// Replace with actual paths of the screens
// Example: import 'package:your_project_name/screens/home_screen.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[200],  // Removed the '!' causing the issue
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'App Name',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.play_circle_outline_sharp),
              title: Text('Posten'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PostingScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('Chats'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatsScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('Gruppen'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GruppenScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Wallet'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => WalletScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Shop'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ShopScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.campaign),
              title: Text('Advertiser'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdvertiserScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChatScreen {
}
