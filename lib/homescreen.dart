import 'package:flutter/material.dart';
import 'package:insta/component/chatscreen.dart';
import 'package:insta/component/post_display.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    print('Building Homepage');
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram"),
        actions: [
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Chatscreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  storyRing("assets/images/story1.jpg", "User 1"),
                  storyRing("assets/images/story2.jpg", "User 2"),
                  storyRing("assets/images/story3.jpg", "User 3"),
                  storyRing("assets/images/story4.jpg", "User 4"),
                  storyRing("assets/images/story5.jpg", "User 5"),
                ],
              ),
            ),
          ),
          // Additional body content can be added here
          Expanded(
            child: PostScreen(), // Displaying posts
          ),
        ],
      ),
    );
  }

  Widget storyRing(String imagePath, String username) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.orange, Colors.yellow],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
              ),
              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(imagePath),
                backgroundColor: Colors.grey[200],
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            username,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
