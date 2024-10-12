import 'package:flutter/material.dart';
import 'newsfeed_appbar.dart'; // Import the AppBar component
import 'sidebar.dart'; // Import the Sidebar component
import 'post_card.dart'; // Import the PostCard component

class NewsFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsFeedAppBar(), // Use the AppBar component
      body: Row(
        children: [
          // Sidebar for Navigation (Left)
          Expanded(
            flex: 2,
            child: Sidebar(), // Use the Sidebar component
          ),

          // Newsfeed Content (Center)
          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PostCard(
                    userName: 'Pamela Jones',
                    postTime: '23. September',
                    postTitle: 'Hier steht der Titel des Posts (max 1 Zeile)',
                    postContent:
                        'Hier steht der beschreibungstext der maximal soooooo lang sein sollte, dass er maaaaximal drei Zeilen füllt.',
                    postImageUrl: 'https://example.com/invalid-url.jpg', // Invalid URL
                    likes: 1273,
                    views: 2526,
                    comments: 67,
                  ),
                  // Add more PostCards as needed
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String userName;
  final String postTime;
  final String postTitle;
  final String postContent;
  final String postImageUrl;
  final int likes;
  final int views;
  final int comments;

  PostCard({
    required this.userName,
    required this.postTime,
    required this.postTitle,
    required this.postContent,
    required this.postImageUrl,
    required this.likes,
    required this.views,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post Header (User info)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/pamela.png'), // Use an asset image for the avatar
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
              ],
            ),
            SizedBox(height: 10),

            // Post Image with error handling
            Image.network(
              postImageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/pamela.png', // Fallback image
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
            SizedBox(height: 10),

            // Post Title and Content
            Text(
              postTitle,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(postContent),
            SizedBox(height: 10),

            // Post Actions (like, view, comment)
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
