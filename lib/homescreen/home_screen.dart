import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // Dummy data for notifications and other features
  final List<String> _notifications = [
    'You have 5 new messages',
    'Your friend John Doe liked your post',
    'Your group meeting is scheduled for tomorrow',
    'New comment on your picture',
    'You were mentioned in a group chat',
  ];

  final List<Map<String, dynamic>> _quickActions = [
    {
      'icon': Icons.person_add,
      'label': 'Add Friend',
    },
    {
      'icon': Icons.group_add,
      'label': 'Create Group',
    },
    {
      'icon': Icons.photo,
      'label': 'Upload Photo',
    },
  ];

  final List<Map<String, String>> _recentActivity = [
    {
      'title': 'John posted a new photo',
      'time': '5 min ago',
    },
    {
      'title': 'Anna joined the travel group',
      'time': '1 hour ago',
    },
    {
      'title': 'New comment on your status',
      'time': '2 hours ago',
    },
    {
      'title': 'You received a friend request',
      'time': '3 hours ago',
    },
  ];
  
  BuildContext? get context => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // First Row: Notifications
            _buildNotificationsSection(),

            SizedBox(height: 20),

            // Second Row: Quick Actions
            _buildQuickActionsSection(),

            SizedBox(height: 20),

            // Third Row: Recent Activity
            _buildRecentActivitySection(),
          ],
        ),
      ),
    );
  }

  // Widget to build the notifications section
  Widget _buildNotificationsSection() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blueAccent),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  for (var notification in _notifications.take(3)) ...[
                    Text(
                      notification,
                      style: TextStyle(fontSize: 16),
                    ),
                    Divider(),
                  ],
                  Text(
                    'See all notifications...',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Widget to build the quick actions section
  Widget _buildQuickActionsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _quickActions.map((action) {
        return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context!).showSnackBar(
              SnackBar(content: Text('${action['label']} tapped')),
            );
          },
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: 30,
                child: Icon(
                  action['icon'],
                  size: 30,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                action['label'],
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Widget to build the recent activity section
  Widget _buildRecentActivitySection() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Activity',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  for (var activity in _recentActivity.take(3)) ...[
                    Text(
                      activity['title']!,
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      activity['time']!,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Divider(),
                  ],
                  Text(
                    'View all recent activity...',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
