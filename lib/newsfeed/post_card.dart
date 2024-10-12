import 'package:flutter/material.dart';

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
