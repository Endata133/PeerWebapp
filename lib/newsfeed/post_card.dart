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

  const PostCard({
    super.key,
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
      margin: const EdgeInsets.all(16.0),
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
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/pamela.png'),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(postTime),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Post Image with error handling
            Image.network(
              postImageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/pamela.png',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
            const SizedBox(height: 10),

            // Post Title and Content
            Text(
              postTitle,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(postContent),
            const SizedBox(height: 10),

            // Post Actions (like, view, comment)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.favorite_border, color: Colors.blue),
                    const SizedBox(width: 5),
                    Text(likes.toString()),
                    const SizedBox(width: 20),
                    const Icon(Icons.visibility, color: Colors.blue),
                    const SizedBox(width: 5),
                    Text(views.toString()),
                    const SizedBox(width: 20),
                    const Icon(Icons.comment, color: Colors.blue),
                    const SizedBox(width: 5),
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
