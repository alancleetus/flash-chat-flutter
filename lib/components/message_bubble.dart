import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text, sender;
  final bool isMe;

  const MessageBubble(
      {Key key,
      @required this.text,
      @required this.sender,
      @required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            elevation: 5.0,
            borderRadius: isMe
                ? (BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    topRight: Radius.circular(30)))
                : (BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                text,
                style: TextStyle(
                    color: isMe ? Colors.white : Colors.black87,
                    fontSize: 15.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(6.0),
            child: Text(
              sender,
              style: TextStyle(color: Colors.black54, fontSize: 12.0),
            ),
          )
        ],
      ),
    );
  }
}
