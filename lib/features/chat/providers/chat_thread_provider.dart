import 'package:flutter/foundation.dart';
import '../models/chat_thread.dart';
import '../services/chat_service.dart';

class ChatThreadProvider extends ChangeNotifier {
  final ChatService _chatService;
  List<ChatThread> _threads = [];
  bool _isLoading = false;
  String _searchQuery = '';

  ChatThreadProvider(this._chatService);

  List<ChatThread> get threads => _filterThreads();
  bool get isLoading => _isLoading;

  List<ChatThread> _filterThreads() {
    if (_searchQuery.isEmpty) return _threads;
    
    return _threads.where((thread) => 
      thread.participantName.toLowerCase().contains(_searchQuery.toLowerCase()) ||
      thread.lastMessage.toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();
  }

  Future<void> loadThreads() async {
    _isLoading = true;
    notifyListeners();

    try {
      _threads = await _chatService.getChatThreads();
      _threads.sort((a, b) => b.lastMessageTime.compareTo(a.lastMessageTime));
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setThreads(List<ChatThread> threads) {
    _threads = threads;
    notifyListeners();
  }
} 