import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/product-14.png',
    'assets/images/product-15.png',
    'assets/images/product-16.png',
    'assets/images/instagram.png',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: imagePaths.map((path) {
        return PostDisplay(
          profileImage: 'assets/images/profile1.jpg',
          username: 'user1',
          postImage: path, // Pass the image path here
          caption: 'This is a caption for this post',
          likes: 120,
        );
      }).toList(), // Convert the map results into a list
    );
  }
}

class PostDisplay extends StatelessWidget {
  final String profileImage;
  final String username;
  final String postImage;
  final String caption;
  final int likes;

  const PostDisplay({
    Key? key,
    required this.profileImage,
    required this.username,
    required this.postImage,
    required this.caption,
    required this.likes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile image and username
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(profileImage),
                  radius: 20,
                ),
                SizedBox(width: 10),
                Text(
                  username,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.more_vert),
              ],
            ),
          ),
          // Post image
          Image.asset(postImage, fit: BoxFit.cover),
          // Post actions (like, comment, share)
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(Icons.favorite_border),
                SizedBox(width: 10),
                Icon(Icons.comment_outlined),
                SizedBox(width: 10),
                Icon(Icons.send),
                Spacer(),
                Icon(Icons.bookmark_border),
              ],
            ),
          ),
          // Like count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              '$likes likes',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          // Caption
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: ' $caption',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
