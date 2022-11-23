import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

//card to represent a single user in home screen
class ChatUserCard extends StatefulWidget {
  const ChatUserCard({super.key});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: mq.width * .04, vertical: 4),
      // color: Colors.blue.shade100,
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {},
        child: const ListTile(
          //user profile picture
          leading: CircleAvatar(child: Icon(CupertinoIcons.person)),

          //user name
          title: Text('Demo User'),

          //last message
          subtitle: Text('Last user message', maxLines: 1),

          //last message time
          trailing: Text(
            '12:00 PM',
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
