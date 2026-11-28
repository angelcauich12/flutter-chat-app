import 'package:chat_app/widgets/chat_message.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  bool _isTyping = false;

  final List<ChatMessage> _messages = [
    // ChatMessage(
    //   text:
    //       "Hello world sadlñaskd asdklasd asdlkasdas dsalkdsa dsaidap´ksadá sañ{sas aSASAsalñS}",
    //   uid: "123",
    // ),
    // ChatMessage(text: "Hello world Come on", uid: "123"),
    // ChatMessage(text: "Hello world XD D DDDDDXD", uid: "123"),
    // ChatMessage(text: "Hello world XD D DDDDDXD", uid: "1233"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            // CircleAvatar(
            //   child: Text("UN", style: TextStyle(fontSize: 12),)),
            // SizedBox(height: 3),
            Text("User Name"),
          ],
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              reverse: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return (_messages[index]);
              },
            ),
          ),

          Divider(height: 1),
          Container(color: Colors.white, child: _inputChat()),
        ],
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                focusNode: _focusNode,
                controller: _textController,
                onSubmitted: _handleSubmit,
                decoration: InputDecoration.collapsed(hintText: "Mensaje"),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _isTyping = true;
                    setState(() {});
                    return;
                  }

                  _isTyping = false;
                  setState(() {});
                },
              ),
            ),
            IconButton.filled(
              onPressed: _isTyping
                  ? () => _handleSubmit(_textController.text.trim())
                  : null,
              icon: Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmit(String text) {
    if (text.isEmpty) return;

    _focusNode.requestFocus();
    _textController.clear();
    _isTyping = false;

    final newMesaage = ChatMessage(
      text: text,
      uid: "123",
      animationController: AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 400),
      ),
    );

    _messages.insert(0, newMesaage);
    newMesaage.animationController.forward();

    setState(() {});
  }
}
