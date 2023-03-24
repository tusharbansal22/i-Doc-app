import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String kOpenAIAPIKey = "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";

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  List<ChatMessage> _messages = [];

  Future<void> _sendMessage(String text) async {
    _textController.clear();
    ChatMessage message = ChatMessage(
      message: text,
      isUser: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    try {
      var url = Uri.parse("https://api.openai.com/v1/chat/completions");
      var response = await http.post(
          url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $kOpenAIAPIKey",
          },
          body: json.encode({
            "prompt": "$text",
            "temperature": 0.7,
            "max_tokens": 64,
            "top_p": 1,
            "frequency_penalty": 0,
            "presence_penalty": 0
          })
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var chatResponse = data['choices'][0]['text'];
        ChatMessage res = ChatMessage(
          message: chatResponse,
          isUser: false,
        );
        setState(() {
          _messages.insert(0, res);
        });
      } else {
        throw Exception('Failed to load response');
      }
    } catch (e) {
      print('Error: $e');
      ChatMessage res = ChatMessage(
        message: 'Sorry, I could not understand you.',
        isUser: false,
      );
      setState(() {
        _messages.insert(0, res);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatBot'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _messages[index],
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _sendMessage,
                decoration:
                InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _sendMessage(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ChatMessage extends StatelessWidget {
  final String message;
  final bool isUser;

  ChatMessage({required this.message, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment:
        isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: isUser ? Colors.blueAccent : Colors.grey[300],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: isUser ? Radius.circular(20.0) : Radius.zero,
                bottomRight: !isUser ? Radius.circular(20.0) : Radius.zero,
              ),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: isUser ? Colors.white : Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
