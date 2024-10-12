import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Add this dependency for image picking

class PostingScreen extends StatefulWidget {
  @override
  _PostingScreenState createState() => _PostingScreenState();
}

class _PostingScreenState extends State<PostingScreen> {
  final TextEditingController _postController = TextEditingController();
  int _charCount = 0;
  final int _maxCharCount = 280;
  XFile? _image;
  String _privacy = 'Public'; // Default privacy setting
  List<String> _tags = [];
  final List<String> _privacyOptions = ['Public', 'Friends', 'Only Me'];

  final ImagePicker _picker = ImagePicker();

  // Function to pick image from gallery
  Future<void> _pickImage() async {
    final XFile? selectedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = selectedImage;
    });
  }

  // Function to remove selected image
  void _removeImage() {
    setState(() {
      _image = null;
    });
  }

  // Function to update character count
  void _updateCharCount(String text) {
    setState(() {
      _charCount = text.length;
    });
  }

  // Function to handle post submission
  void _submitPost() {
    if (_postController.text.isNotEmpty || _image != null) {
      // Here you would add the logic to send the post data to your server
      print('Post submitted with content: ${_postController.text}');
      print('Privacy: $_privacy');
      if (_image != null) {
        print('Image attached: ${_image?.path}');
      }
      if (_tags.isNotEmpty) {
        print('Tags: ${_tags.join(', ')}');
      }

      // Clear post after submission
      setState(() {
        _postController.clear();
        _image = null;
        _charCount = 0;
        _tags.clear();
      });

      // Show confirmation message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Post submitted successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please add text or an image to post!')),
      );
    }
  }

  // Function to add a tag (for hashtags or people tagging)
  void _addTag(String tag) {
    if (tag.isNotEmpty && !_tags.contains(tag)) {
      setState(() {
        _tags.add(tag);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posten'),
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _submitPost,
            tooltip: 'Submit Post',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Text Field for Post Content
            TextField(
              controller: _postController,
              maxLength: _maxCharCount,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'What\'s on your mind?',
                border: OutlineInputBorder(),
              ),
              onChanged: _updateCharCount,
            ),

            // Character Count Indicator
            Align(
              alignment: Alignment.centerRight,
              child: Text('$_charCount/$_maxCharCount'),
            ),

            SizedBox(height: 20),

            // Privacy Dropdown
            DropdownButtonFormField<String>(
              value: _privacy,
              decoration: InputDecoration(
                labelText: 'Who can see this post?',
                border: OutlineInputBorder(),
              ),
              onChanged: (String? newValue) {
                setState(() {
                  _privacy = newValue!;
                });
              },
              items: _privacyOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            SizedBox(height: 20),

            // Image Preview and Picker Button
            _image != null
                ? Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.file(
                        File(_image!.path),
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      IconButton(
                        icon: Icon(Icons.cancel, color: Colors.red),
                        onPressed: _removeImage,
                      ),
                    ],
                  )
                : ElevatedButton.icon(
                    icon: Icon(Icons.photo),
                    label: Text('Add Image'),
                    onPressed: _pickImage,
                  ),

            SizedBox(height: 20),

            // Tags Input Field (e.g., for hashtags or mentions)
            TextField(
              decoration: InputDecoration(
                labelText: 'Add tags (e.g., #flutter, @user)',
                border: OutlineInputBorder(),
              ),
              onSubmitted: _addTag,
            ),

            SizedBox(height: 10),

            // Display added tags
            Wrap(
              spacing: 8.0,
              children: _tags
                  .map((tag) => Chip(
                        label: Text(tag),
                        onDeleted: () {
                          setState(() {
                            _tags.remove(tag);
                          });
                        },
                      ))
                  .toList(),
            ),

            SizedBox(height: 20),

            // Submit Button
            ElevatedButton.icon(
              icon: Icon(Icons.send),
              label: Text('Post'),
              onPressed: _submitPost,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
