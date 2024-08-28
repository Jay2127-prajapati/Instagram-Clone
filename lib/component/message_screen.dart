import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart'; // Import uuid package for generating unique IDs

class MessageScreen extends StatefulWidget {
  final String chatUsername; // Username of the chat partner
  final List<types.User> users; // List of users involved in the chat

  const MessageScreen({super.key, required this.chatUsername, required this.users});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<types.Message> _messages = [];
  late types.User _currentUser;

  @override
  void initState() {
    super.initState();
    // Initialize the current user (for demo purposes, using the first user from the list)
    _currentUser = widget.users.isNotEmpty ? widget.users.first : types.User(id: 'default');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chatUsername),
      ),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _currentUser,
      ),
    );
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _currentUser,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: Uuid().v4(), // Generate a unique ID for each message
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }
}
