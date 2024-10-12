import 'package:flutter/material.dart';

class GruppenScreen extends StatefulWidget {
  @override
  _GruppenScreenState createState() => _GruppenScreenState();
}

class _GruppenScreenState extends State<GruppenScreen> {
  final List<Map<String, dynamic>> _groups = [
    {
      'name': 'Flutter Developers',
      'description': 'A group for Flutter enthusiasts to share knowledge and resources.',
      'isMember': true,
      'groupIcon': 'assets/flutter_group.png'
    },
    {
      'name': 'Music Lovers',
      'description': 'A place to discuss your favorite genres, artists, and albums.',
      'isMember': false,
      'groupIcon': 'assets/music_group.png'
    },
    {
      'name': 'Travel Adventures',
      'description': 'Share your travel experiences and tips with fellow travelers.',
      'isMember': false,
      'groupIcon': 'assets/travel_group.png'
    },
    // Add more groups here
  ];

  // Function to handle joining or visiting the group
  void _handleGroupAction(int index) {
    setState(() {
      if (_groups[index]['isMember']) {
        // Navigate to the group page
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Visiting ${_groups[index]['name']} group')),
        );
      } else {
        // Join the group
        _groups[index]['isMember'] = true;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Joined ${_groups[index]['name']}')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gruppen'),
      ),
      body: ListView.builder(
        itemCount: _groups.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  // Group Icon
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(_groups[index]['groupIcon']),
                  ),
                  SizedBox(width: 10),
                  
                  // Group Name and Description
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _groups[index]['name'],
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          _groups[index]['description'],
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),

                  // Join/Visit Button
                  ElevatedButton(
                    onPressed: () => _handleGroupAction(index),
                    child: Text(_groups[index]['isMember'] ? 'Visit' : 'Join'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _groups[index]['isMember'] ? Colors.green : Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
