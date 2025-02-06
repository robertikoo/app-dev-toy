import '../models/chat_message.dart';
import '../models/chat_thread.dart';

abstract class ChatService {
  Future<List<ChatMessage>> getMessages(String threadId);
  Future<List<ChatThread>> getChatThreads();
  Future<void> sendMessage(ChatMessage message);
  Future<void> markThreadAsRead(String threadId);
}

class ChatServiceImpl implements ChatService {
  @override
  Future<List<ChatThread>> getChatThreads() async {
    // Implement actual API call here
    return [];
  }

  @override
  Future<List<ChatMessage>> getMessages(String threadId) async {
    // Implement actual API call here
    return [];
  }

  @override
  Future<void> sendMessage(ChatMessage message) async {
    // Implement actual API call here
  }

  @override
  Future<void> markThreadAsRead(String threadId) async {
    // Implement actual API call here
  }
} 