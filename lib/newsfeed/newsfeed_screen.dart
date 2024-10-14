import 'package:flutter/material.dart';
import 'package:flutter_application_1/newsfeed/post_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'newsfeed_appbar.dart'; // Import the AppBar component
import 'sidebar.dart'; // Import the Sidebar component
import 'post_card.dart'; // Import the PostCard component

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  _NewsFeedScreenState createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  PostService postService = PostService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsFeedAppBar(), // Use the AppBar component
      body: Row(
        children: [
          // Sidebar for Navigation (Left)
          Expanded(
            flex: 2,
            child: Sidebar(), // Use the Sidebar component with icons restored
          ),

          // Newsfeed Content (Center)
          Expanded(
            flex: 6,
            child: FutureBuilder<QueryResult<Object?>>(
              future: postService.fetchAllPosts(),
              builder: (BuildContext context, AsyncSnapshot<QueryResult<Object?>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error loading posts'));
                }

                // Check if snapshot has data and if the 'data' field is not null
                if (!snapshot.hasData || snapshot.data?.data == null) {
                  return Center(child: Text('No posts available'));
                  
                }

                // Assuming the data is available in the 'getallposts' key
                final posts = snapshot.data!.data?['getallposts'];

                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return PostCard(
                      userName: post['user']['username'],
                      postTime: post['createdat'],
                      postTitle: post['title'],
                      postContent: post['mediadescription'] ?? '',
                      postImageUrl: post['media'] ?? '',
                      likes: post['amountlikes'] ?? 0,
                      views: post['amountviews'] ?? 0,
                      comments: post['amountcomments'] ?? 0,
                    );
                  },
                );
              },
            ),
          ),

          // Optional Right Sidebar for Ads or Additional Content (Right)
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[300],
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Sponsored Ads',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 100,
                    color: Colors.blueAccent,
                    child: const Center(child: Text('Ad 1')),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 100,
                    color: Colors.greenAccent,
                    child: const Center(child: Text('Ad 2')),
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
                      backgroundImage: AssetImage('assets/pamela.png'), // Use an asset image for the avatar
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
                  'assets/pamela.png', // Fallback image
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
