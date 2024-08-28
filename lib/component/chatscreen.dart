import 'package:flutter/material.dart';
import 'package:insta/component/message_screen.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class Chatscreen extends StatefulWidget {
  const Chatscreen({super.key});

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  final List<Chat> chats = [
    Chat(username: "User 1", imagePath: "assets/images/story1.jpg"),
    Chat(username: "User 2", imagePath: "assets/images/story2.jpg"),
    Chat(username: "User 3", imagePath: "assets/images/story3.jpg"),
    Chat(username: "User 4", imagePath: "assets/images/story4.jpg"),
    Chat(username: "User 5", imagePath: "assets/images/story5.jpg"),
    Chat(username: "User 5", imagePath: "assets/images/story5.jpg"),
    Chat(username: "User 5", imagePath: "assets/images/story5.jpg"),
    Chat(username: "User 5", imagePath: "assets/images/story5.jpg"),
    Chat(username: "User 5", imagePath: "assets/images/story5.jpg"),
    Chat(username: "User 5", imagePath: "assets/images/story5.jpg"),
    Chat(username: "User 5", imagePath: "assets/images/story5.jpg"),
    Chat(username: "User 5", imagePath: "assets/images/story5.jpg"),
  ];

  final List<types.User> users = [
    const types.User(id: 'user1', firstName: 'User 1'),
    const types.User(id: 'user2', firstName: 'User 2'),
    const types.User(id: 'user3', firstName: 'User 3'),
    const types.User(id: 'user4', firstName: 'User 4'),
    const types.User(id: 'user5', firstName: 'User 5'),
    const types.User(id: 'user5', firstName: 'User 5'),
    const types.User(id: 'user5', firstName: 'User 5'),
    const types.User(id: 'user5', firstName: 'User 5'),
    const types.User(id: 'user5', firstName: 'User 5'),
    const types.User(id: 'user5', firstName: 'User 5'),
    const types.User(id: 'user5', firstName: 'User 5'),
    const types.User(id: 'user5', firstName: 'User 5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: Text('@username'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Handle add action here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 35,
            margin: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
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
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                final user = users.firstWhere((user) => user.firstName == chat.username, orElse: () => types.User(id: 'default'));

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MessageScreen(
                          chatUsername: chat.username,
                          users: [user], // Pass the user data for this chat
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 238, 241, 244),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(chat.imagePath),
                          radius: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          chat.username,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Spacer(),
                        Icon(Icons.more_vert, color: Colors.black),
                      ],
                    ),
                  ),
                );
              },
            ),
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
                    colors: [
                      Colors.red,
                      Colors.orange,
                      Colors.yellow,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
              ),
              CircleAvatar(
                radius: 36,
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

class Chat {
  final String username;
  final String imagePath;

  Chat({required this.username, required this.imagePath});
}
