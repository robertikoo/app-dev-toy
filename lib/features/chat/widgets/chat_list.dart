import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,  // Replace with your actual item count
      itemBuilder: (context, index) {
        return const ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          title: Text('Chat Item'),
          subtitle: Text('Last message'),
          trailing: Text('12:00'),
        );
      },

    );
  }
}
