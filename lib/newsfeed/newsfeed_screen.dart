import 'package:flutter/material.dart';

class NewsFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Newsfeed'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Handle profile
            },
          ),
        ],
      ),
      body: Row(
        children: [
          // Optional Sidebar for Navigation (Left)
          Expanded(
            flex: 2,
            child: Container(
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
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {
                      // Handle Settings Tap
                    },
                  ),
                  // Add more navigation options as needed
                ],
              ),
            ),
          ),

          // Newsfeed Content (Center)
          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildPostCard(
                    context,
                    userName: 'Pamela Jones',
                    postTime: '23. September',
                    postTitle: 'Hier steht der Titel des Posts (max 1 Zeile)',
                    postContent:
                        'hier steht der beschreibungstext der maximal soooooo lang sein sollte, dass er maaaaximal drei Zeilen füllt.',
                    postImageUrl: 'https://example.com/image1.jpg',
                    likes: 1273,
                    views: 2526,
                    comments: 67,
                  ),
                  // Add more posts as needed
                ],
              ),
            ),
          ),

          // Optional Right Sidebar for Ads or Additional Content (Right)
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[300],
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Sponsored Ads',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 100,
                    color: Colors.blueAccent,
                    child: Center(child: Text('Ad 1')),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 100,
                    color: Colors.greenAccent,
                    child: Center(child: Text('Ad 2')),
                  ),
                  // Add more widgets for additional content
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build a post card
  Widget _buildPostCard(BuildContext context,
      {required String userName,
      required String postTime,
      required String postTitle,
      required String postContent,
      required String postImageUrl,
      required int likes,
      required int views,
      required int comments}) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile and unfollow button at the top
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://example.com/user_avatar.jpg'), // Use correct user avatar URL
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(postTime),
                      ],
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Handle unfollow logic
                  },
                  child: Text(
                    'unfollow',
                    style: TextStyle(color: Colors.grey),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Post image
            Image.network(
              postImageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),

            // Post title and content
            Text(
              postTitle,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(postContent),
            SizedBox(height: 10),

            // Post actions (like, view, comment) and date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite_border, color: Colors.blue),
                    SizedBox(width: 5),
                    Text(likes.toString()),
                    SizedBox(width: 20),
                    Icon(Icons.visibility, color: Colors.blue),
                    SizedBox(width: 5),
                    Text(views.toString()),
                    SizedBox(width: 20),
                    Icon(Icons.comment, color: Colors.blue),
                    SizedBox(width: 5),
                    Text('$comments Comments'),
                  ],
                ),
                Text(postTime),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
