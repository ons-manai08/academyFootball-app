import 'package:flutter/material.dart';
import 'package:academy_football/joueur/Player.dart';
class ChatScreen extends StatefulWidget {
  final Player player;

  ChatScreen({required this.player});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.player.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text('Chat with ${widget.player.name}'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Type your message here',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  // Send the message
                  _textController.clear();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

