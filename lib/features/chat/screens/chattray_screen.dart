import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/chat_thread_provider.dart';
import '../widgets/chat_thread_item.dart';
import '../widgets/filter_chips.dart';
import 'chat_screen.dart';
import '../../../shared/layouts/main_layout.dart';
import '../models/chat_thread.dart';

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
        participantAvatar: 'https://i.pravatar.cc/150?img=1',
        lastMessage: 'Hey, how are you?',
        lastMessageTime: DateTime.now().subtract(const Duration(minutes: 5)),
        unreadCount: 2,
        isOnline: true,
      ),
      ChatThread(
        id: '2',
        participantId: '102',
        participantName: 'Juan Perez',
        participantAvatar: 'https://i.pravatar.cc/150?img=2',
        lastMessage: 'The meeting is scheduled for tomorrow',
        lastMessageTime: DateTime.now().subtract(const Duration(hours: 1)),
        unreadCount: 0,
        isOnline: false,

      ),
      ChatThread(
        id: '3',
        participantId: '103',
        participantName: 'Nombre Apellido',
        participantAvatar: 'https://i.pravatar.cc/150?img=3',
        lastMessage: 'Thanks for your help!',
        lastMessageTime: DateTime.now().subtract(const Duration(days: 1)),
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
      // For testing, use mock data instead of loading from server
      provider.setThreads(_getMockThreads());
      // Comment out the actual loading for now
      // provider.loadThreads();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBar: AppBar(
        title: const Text('Chats'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search
            },
          ),
        ],
      ),
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
