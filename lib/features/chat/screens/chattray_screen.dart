import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/chat_thread_provider.dart';
import '../widgets/chat_thread_item.dart';
import 'chat_screen.dart';
import '../models/chat_thread.dart';
import '../widgets/filter_chips.dart';

class ChatTrayScreen extends StatefulWidget {
  const ChatTrayScreen({super.key});

  @override
  State<ChatTrayScreen> createState() => _ChatTrayScreenState();
}

class _ChatTrayScreenState extends State<ChatTrayScreen> {
  List<ChatThread> _getMockThreads() {
    return [
      ChatThread(
        id: '1',
        participantId: '101',
        participantName: 'Emilio Sandoval',
        participantAvatar: 'assets/images/avatar_placeholder.png',
        lastMessage: 'Hey, how are you?',
        lastMessageTime: DateTime.now().subtract(const Duration(hours: 1)),
        unreadCount: 2,
        isOnline: true,
      ),
      ChatThread(
        id: '2',
        participantId: '102',
        participantName: 'Nombre Apellido',
        participantAvatar: 'assets/images/avatar_placeholder.png',
        lastMessage: 'The meeting is scheduled for tomorrow',
        lastMessageTime: DateTime.now().subtract(const Duration(hours: 4)),
        unreadCount: 0,
        isOnline: false,
      ),
      ChatThread(
        id: '3',
        participantId: '103',
        participantName: 'Nombre Apellido',
        participantAvatar: 'assets/images/avatar_placeholder.png',
        lastMessage: 'Thanks for your help!',
        lastMessageTime: DateTime.now().subtract(const Duration(hours: 10)),
        unreadCount: 0,
        isOnline: false,
      ),
      ChatThread(
        id: '4',
        participantId: '104',
        participantName: 'Nombre Apellido',
        participantAvatar: 'assets/images/avatar_placeholder.png',
        lastMessage: 'See you tomorrow!',
        lastMessageTime: DateTime.now().subtract(const Duration(days: 1)),
        unreadCount: 0,
        isOnline: false,
      ),
      ChatThread(
        id: '5',
        participantId: '105',
        participantName: 'Nombre Apellido',
        participantAvatar: 'assets/images/avatar_placeholder.png',
        lastMessage: 'Great work!',
        lastMessageTime: DateTime.now().subtract(const Duration(days: 3)),
        unreadCount: 0,
        isOnline: false,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final provider = Provider.of<ChatThreadProvider>(context, listen: false);
      provider.setThreads(_getMockThreads());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: Column(
        children: [
          const FilterChips(),
          Expanded(
            child: Consumer<ChatThreadProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                
                if (provider.threads.isEmpty) {
                  return const Center(
                    child: Text('No hay chats disponibles'),
                  );
                }

                return RefreshIndicator(
                  onRefresh: provider.loadThreads,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                    itemCount: provider.threads.length,
                    itemBuilder: (context, index) {
                      final thread = provider.threads[index];
                      return ChatThreadItem(
                        thread: thread,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                receiverId: thread.participantId,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
