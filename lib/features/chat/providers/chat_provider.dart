import 'package:flutter/foundation.dart';
import '../models/chat_message.dart';
import '../services/chat_service.dart';

class ChatProvider extends ChangeNotifier {
  final ChatService _chatService;
  List<ChatMessage> _messages = [];
  bool _isLoading = false;

  ChatProvider(this._chatService);

  List<ChatMessage> get messages => _messages;
  bool get isLoading => _isLoading;

  Future<void> loadMessages() async {
    _isLoading = true;
    notifyListeners();
    try {
      _messages = await _chatService.getMessages('chat');
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> sendMessage(ChatMessage message) async {
    await _chatService.sendMessage(message);
    _messages.add(message);
    notifyListeners();
  }

  void setMessages(List<ChatMessage> messages) {
    _messages = messages;
    notifyListeners();
  }

  void addMessage(ChatMessage message) {
    _messages.add(message);
    notifyListeners();
  }
} 