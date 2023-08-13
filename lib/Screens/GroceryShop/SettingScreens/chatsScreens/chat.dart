import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../models/messagemodel.dart';
import '../../../../widgets/text/constants.dart';

class ConversationScreen extends StatefulWidget {
  final String imagepath;
  final String storetitle;
  const ConversationScreen(
      {super.key, required this.imagepath, required this.storetitle});

  @override
  // ignore: library_private_types_in_public_api
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Mytypingappbar(
        text: widget.storetitle,
        onpressed: () => Navigator.pop(context),
        imagepath: widget.imagepath,
      ),
      // backgroundColor: const Color(0xff23AA49)
      // .withOpacity(0.12), // Set the background color here
      body: ConversationBody(
        imagepath: widget.imagepath,
      ),
    );
  }
}

class ConversationBody extends StatefulWidget {
  final String imagepath;
  const ConversationBody({super.key, required this.imagepath});

  @override
  // ignore: library_private_types_in_public_api
  _ConversationBodyState createState() => _ConversationBodyState();
}

class _ConversationBodyState extends State<ConversationBody> {
  final List<Message> _messages = [];

  void _addMessage(String text, bool isMe) {
    setState(() {
      _messages.add(Message(text, isMe));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              final message = _messages[index];
              return MessageBubble(
                message: message,
                imagepath: widget.imagepath,
              );
            },
          ),
        ),
        MessageInput(
          onSendMessage: (message) {
            _addMessage(message, true);
          },
        ),
      ],
    );
  }
}

class MessageBubble extends StatelessWidget {
  final Message message;
  final String imagepath;

  const MessageBubble(
      {super.key, required this.message, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment:
            message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          message.isMe
              ? Container()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: CircleAvatar(
                      radius: 24, backgroundImage: AssetImage(imagepath)),
                ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: message.isMe
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(0),
                    )
                  : const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(20),
                    ),
              color: message.isMe ? null : const Color(0xffF0F1F1),
              gradient: message.isMe
                  ? LinearGradient(
                      colors: [
                        const Color(0xff07CD6E),
                        const Color(0xff059F55).withOpacity(0.86),
                      ],
                    )
                  : null,
            ),
            child: Text(
              message.text,
              style: message.isMe ? k12white400 : k12darkgrey400,
            ),
          ),
        ],
      ),
    );
  }
}

class MessageInput extends StatefulWidget {
  final void Function(String) onSendMessage;

  const MessageInput({super.key, required this.onSendMessage});

  @override
  // ignore: library_private_types_in_public_api
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    final message = _controller.text;

    if (message.isNotEmpty) {
      widget.onSendMessage(message);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: typingcardcontainerdecoration,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          // Add spacing between divider and text field
          Container(
            width: MediaQuery.of(context).size.width * 0.84,
            padding: const EdgeInsets.only(left: 4),
            decoration: BoxDecoration(
              color: const Color(0xff23AA49).withOpacity(0.12),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              children: [
                Expanded(
                  // width: 221,
                  child: TextField(
                    style: k12darkgrey400,
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: InputBorder.none,
                      hintStyle: k12lightgrey400,
                    ),
                    onSubmitted: (message) => _sendMessage(),
                  ),
                ),
                Container(
                  color: const Color(0xff9C9D9D), // Customize the divider color
                  width: 0.5,
                  height: 30,
                ),
                const SizedBox(
                  width: 12,
                ),
                InkWell(
                  child: Image.asset(
                    'images/attact.png',
                    width: 14,
                    height: 14,
                  ),
                  onTap: () {},
                ),
                const SizedBox(
                  width: 12,
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      'images/camera.png',
                      width: 16,
                      height: 13.38,
                    ),
                  ),
                  onTap: () {},
                )
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          GestureDetector(
            child: Image.asset(
              'images/send.png',
              width: 32,
              height: 32,
            ),
            onTap: () {
              setState(() {
                if (_controller.text.isEmpty) {
                  Fluttertoast.showToast(
                    msg: 'Message cannot be Empty',
                    backgroundColor: Colors.red,
                    fontSize: 14,
                    gravity: ToastGravity.BOTTOM,
                    textColor: Colors.white,
                    toastLength: Toast.LENGTH_SHORT,
                    timeInSecForIosWeb: 1,
                  );
                }
                _sendMessage();
              });
            },
          )
        ],
      ),
    );
  }
}
