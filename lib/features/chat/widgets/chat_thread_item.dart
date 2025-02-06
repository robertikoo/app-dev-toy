import 'package:flutter/material.dart';
import '../models/chat_thread.dart';
import '../../../shared/utils/constants.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatThreadItem extends StatelessWidget {
  final ChatThread thread;
  final VoidCallback onTap;

  const ChatThreadItem({
    Key? key,
    required this.thread,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(thread.participantAvatar),
            radius: 25,
          ),
          if (thread.isOnline)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        thread.participantName,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        thread.lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            timeago.format(thread.lastMessageTime),
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
          if (thread.unreadCount > 0)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Text(
                thread.unreadCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
} 