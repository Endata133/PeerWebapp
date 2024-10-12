import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final List<Map<String, String>> _chats = [
    {
      'name': 'John Doe',
      'lastMessage': 'Hey, how are you?',
      'time': '2:15 PM',
      'profilePic': 'assets/john_doe.png'
    },
    {
      'name': 'Jane Smith',
      'lastMessage': 'Let\'s catch up later!',
      'time': '1:12 PM',
      'profilePic': 'assets/jane_smith.png'
    },
    {
      'name': 'Alice Brown',
      'lastMessage': 'Can you send me the files?',
      'time': 'Yesterday',
      'profilePic': 'assets/alice_brown.png'
    },
    // Add more chats here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _chats.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(_chats[index]['profilePic']!),
            ),
            title: Text(_chats[index]['name']!),
            subtitle: Text(_chats[index]['lastMessage']!),
            trailing: Text(_chats[index]['time']!, style: TextStyle(color: Colors.grey)),
            onTap: () {
              // Handle chat tap (navigate to detailed chat screen)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Opening chat with ${_chats[index]['name']}')),
              );
            },
          );
        },
      ),
    );
  }
}
