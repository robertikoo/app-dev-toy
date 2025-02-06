import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/chat_provider.dart';
import '../widgets/chat_message_item.dart';
import '../models/chat_message.dart';

class ChatScreen extends StatefulWidget {
  final String receiverId;

  const ChatScreen({
    super.key,
    required this.receiverId,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();

  List<ChatMessage> _getMockMessages() {
    return [
      ChatMessage(
        id: '1',
        senderId: '101',
        receiverId: 'currentUserId',
        message: 'Hey, how are you?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
      ),
      ChatMessage(
        id: '2',

        senderId: 'currentUserId',
        receiverId: '101',
        message: 'I\'m good! How about you?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 25)),

      ),
      ChatMessage(
        id: '3',
        senderId: '101',
        receiverId: 'currentUserId',
        message: 'Doing great! Did you check the latest project updates?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 20)),

      ),
      ChatMessage(
        id: '4',
        senderId: 'currentUserId',
        receiverId: '101',
        message: 'Yes, I did! Everything looks good.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 15)),

      ),
      ChatMessage(
        id: '5',
        senderId: '101',
        receiverId: 'currentUserId',
        message: 'Perfect! Let\'s discuss it in tomorrow\'s meeting.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 10)),

      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final provider = Provider.of<ChatProvider>(context, listen: false);
      if (widget.receiverId == '101') {
        // Load mock messages only for user 101
        provider.setMessages(_getMockMessages());
      } else {
        // For other users, clear messages or load from server
        provider.setMessages([]);
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<ChatProvider>(
              builder: (context, chatProvider, child) {
                if (chatProvider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: chatProvider.messages.length,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messages[index];
                    return ChatMessageItem(
                      message: message,
                      isMe: message.senderId == 'currentUserId', // Replace with actual user ID
                    );
                  },
                );
              },
            ),
          ),
          _buildMessageInput(context),
        ],
      ),
    );
  }

  Widget _buildMessageInput(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              final message = _textController.text.trim();
              if (message.isNotEmpty) {
                // Add mock message
                final provider = Provider.of<ChatProvider>(context, listen: false);
                provider.addMessage(ChatMessage(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  senderId: 'currentUserId',
                  receiverId: widget.receiverId,
                  message: message,
                  timestamp: DateTime.now(),
                ));
                _textController.clear();

              }
            },
          ),
        ],
      ),
    );
  }
}
