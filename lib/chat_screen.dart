import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'chat_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _message = [];

  // This function is called when the user presses the send button
  void _sendMessage() {
    ChatMessage _message = ChatMessage(
      text: _controller.text,
      sender: "User",
    );
    //
    // setState(() {
    //   _message.insert(0, _message); // Append the message to the list
    // });

    _controller.clear(); // Clear the text field
  }

  Widget _buildComposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: (value) => _sendMessage(), // Send the message

            decoration:
                const InputDecoration.collapsed(hintText: "Send a message"),
          ),
        ),
        IconButton(
            onPressed: () => _sendMessage(), icon: const Icon(Icons.send))
      ],
    ).px16();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChatGPT App"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
              reverse: true,
              padding: Vx.m8,
              itemCount: _message.length,
              itemBuilder: (context, index) {
                return _message[index];
              },
            )),
            Container(
              decoration: BoxDecoration(color: context.cardColor),
              child: _buildComposer(),
            )
          ],
        ),
      ),
    );
  }
}
